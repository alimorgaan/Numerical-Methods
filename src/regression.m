classdef regression < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        SolveButton            matlab.ui.control.Button
        DropDown               matlab.ui.control.DropDown
        LinearRegressionLabel  matlab.ui.control.Label
        DataLabel              matlab.ui.control.Label
        ModelLabel             matlab.ui.control.Label
        UITable                matlab.ui.control.Table
        AddnewpointButton      matlab.ui.control.Button
        aLabel                 matlab.ui.control.Label
        bLabel                 matlab.ui.control.Label
        rLabel                 matlab.ui.control.Label
        a                      matlab.ui.control.Label
        b                      matlab.ui.control.Label
        r                      matlab.ui.control.Label
    end

    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.UITable.Data = [[0 ; 0 ; 0] [0 ; 0 ; 0 ]] ;  
        end

        % Button pushed function: SolveButton
        function SolveButtonPushed(app, event)
              
            data = get(app.UITable , 'data') ; 
            xsum = sum(data(: , 1)) ;
            x2 = data(: , 1).* data(: , 1);  
            x2sum = sum(x2) ; 
            ysum = sum(data(: , 2)) ;
            n = size(data, 1); 
            xyArray = zeros( n  , 1) ; 
            xyArray = data(: , 1) .* data(: , 2) ; 
            xysum = sum(xyArray) ; 
            A = [n xsum ; xsum  x2sum];
            B = [ysum ; xysum];
            solution = linsolve(A,B) ; 
            a0 = solution(1) ; 
            a1 = solution(2) ;
            x = linspace(min(data(: , 1)) , max(data(: , 1)) , 1000) ;
            y =a0 + a1.*x ;
            figure ; 
            scatter( (data(: , 1))'  , (data(: , 2))'); 
            hold on ; 
            plot(x, y) ; 

            switch app.DropDown.Value
                case 'Exponential model'
                    data = get(app.UITable , 'data') ; 
                    y = log(data(: , 2)) ; 
                    x = data(: , 1) ; 
                    xsum = sum(x) ;
                    x2 = x.* x;  
                    x2sum = sum(x2) ; 
                    ysum = sum(y) ;
                    n = size(data, 1); 
                    xyArray = zeros( n  , 1) ; 
                    xyArray = x .* y ; 
                    xysum = sum(xyArray) ; 
                    A = [n xsum ; xsum  x2sum];
                    B = [ysum ; xysum];
                    solution = linsolve(A,B) ; 
                    a0 = solution(1) ; 
                    a1 = solution(2) ;
                
                    a = exp(a0) ;
                    b = a1 ; 
                    app.a.Text = string(a) ; 
                    app.b.Text = string(b) ; 
                    xgraph = linspace(min(data(:,1)) , max(data(:,1)) , 1000);
                    ygraph = a*exp(xgraph*b) ; 
                    plot(xgraph , ygraph) ; 
                    
                    avrg = mean(y); 
                    st = sum((y - avrg).^2) ; 
                    sr = sum((y- a0 - x.*a1 ).^2) ; 
                    r = sqrt((st - sr)/st); 
                    app.r.Text = string(r); 
                case 'Power model' 
                    data = get(app.UITable , 'data') ; 
                    y = log10(data(: , 2)) ; 
                    x = log10(data(: , 1)) ; 
                    xsum = sum(x) ;
                    x2 = x.* x;  
                    x2sum = sum(x2) ; 
                    ysum = sum(y) ;
                    n = size(data, 1); 
                    xyArray = zeros( n  , 1) ; 
                    xyArray = x .* y ; 
                    xysum = sum(xyArray) ; 
                    A = [n xsum ; xsum  x2sum];
                    B = [ysum ; xysum];
                    solution = linsolve(A,B) ; 
                    a0 = solution(1) ; 
                    a1 = solution(2) ;
                   
                    a = 10^a0 ;
                    b = a1 ; 
                    app.a.Text = string(a) ; 
                    app.b.Text = string(b) ; 
                    xgraph = linspace(min(data(:,1)) , max(data(:,1)) , 1000);
                    ygraph = a*xgraph.^b; 
                    plot(xgraph , ygraph) ; 
                    
                     avrg = mean(y); 
                    st = sum((y - avrg).^2) ; 
                    sr = sum((y- a0 - x.*a1 ).^2) ; 
                    r = sqrt((st - sr)/st); 
                    app.r.Text = string(r); 
                    
                case 'Growth rate model' 
                    data = get(app.UITable , 'data') ; 
                    y = 1./(data(: , 2)) ; 
                    x = 1./(data(: , 1)) ; 
                    xsum = sum(x) ;
                    x2 = x.* x;  
                    x2sum = sum(x2) ; 
                    ysum = sum(y) ;
                    n = size(data, 1); 
                    xyArray = zeros( n  , 1) ; 
                    xyArray = x .* y ; 
                    xysum = sum(xyArray) ; 
                    A = [n xsum ; xsum  x2sum];
                    B = [ysum ; xysum];
                    solution = linsolve(A,B) ; 
                    a0 = solution(1) ; 
                    a1 = solution(2) ;
                    
                   
                    a = 1/a0 ;
                    b = a1*a ; 
                    app.a.Text = string(a) ; 
                    app.b.Text = string(b) ; 
                    xgraph = linspace(min(data(:,1)) , max(data(:,1)) , 1000);
                    ygraph = (a*xgraph)./(b+xgraph); 
                    plot(xgraph , ygraph) ; 
                    
                     avrg = mean(y); 
                    st = sum((y - avrg).^2) ; 
                    sr = sum((y- a0 - x.*a1 ).^2) ; 
                    r = sqrt((st - sr)/st); 
                    app.r.Text = string(r); 
                    
            end            
        end

        % Button pushed function: AddnewpointButton
        function AddnewpointButtonPushed(app, event)
            data = get(app.UITable , 'data') ; 
            data(end+1 , : ) = 0 ; 
            set(app.UITable, 'data', data);
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Color = [0.9412 0.9412 0.9412];
            app.UIFigure.Position = [100 100 329 496];
            app.UIFigure.Name = 'UI Figure';

            % Create SolveButton
            app.SolveButton = uibutton(app.UIFigure, 'push');
            app.SolveButton.ButtonPushedFcn = createCallbackFcn(app, @SolveButtonPushed, true);
            app.SolveButton.BackgroundColor = [0.9294 0.6902 0.1294];
            app.SolveButton.FontSize = 20;
            app.SolveButton.FontWeight = 'bold';
            app.SolveButton.FontColor = [1 1 1];
            app.SolveButton.Position = [26 24 277 34];
            app.SolveButton.Text = 'Solve';

            % Create DropDown
            app.DropDown = uidropdown(app.UIFigure);
            app.DropDown.Items = {'Exponential model', 'Power model', 'Growth rate model'};
            app.DropDown.FontSize = 16;
            app.DropDown.Position = [26 74 277 24];
            app.DropDown.Value = 'Exponential model';

            % Create LinearRegressionLabel
            app.LinearRegressionLabel = uilabel(app.UIFigure);
            app.LinearRegressionLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.LinearRegressionLabel.FontSize = 28;
            app.LinearRegressionLabel.FontWeight = 'bold';
            app.LinearRegressionLabel.Position = [45 454 253 34];
            app.LinearRegressionLabel.Text = 'Linear Regression';

            % Create DataLabel
            app.DataLabel = uilabel(app.UIFigure);
            app.DataLabel.FontSize = 20;
            app.DataLabel.FontWeight = 'bold';
            app.DataLabel.Position = [139 407 49 25];
            app.DataLabel.Text = 'Data';

            % Create ModelLabel
            app.ModelLabel = uilabel(app.UIFigure);
            app.ModelLabel.FontSize = 20;
            app.ModelLabel.FontWeight = 'bold';
            app.ModelLabel.Position = [140 107 58 25];
            app.ModelLabel.Text = 'Model';

            % Create UITable
            app.UITable = uitable(app.UIFigure);
            app.UITable.ColumnName = {'X'; 'Y'};
            app.UITable.RowName = {};
            app.UITable.ColumnEditable = true;
            app.UITable.FontSize = 16;
            app.UITable.Position = [28 230 277 168];

            % Create AddnewpointButton
            app.AddnewpointButton = uibutton(app.UIFigure, 'push');
            app.AddnewpointButton.ButtonPushedFcn = createCallbackFcn(app, @AddnewpointButtonPushed, true);
            app.AddnewpointButton.BackgroundColor = [0.4706 0.6706 0.1882];
            app.AddnewpointButton.FontSize = 18;
            app.AddnewpointButton.FontWeight = 'bold';
            app.AddnewpointButton.FontColor = [1 1 1];
            app.AddnewpointButton.Position = [26 183 277 34];
            app.AddnewpointButton.Text = 'Add new point';

            % Create aLabel
            app.aLabel = uilabel(app.UIFigure);
            app.aLabel.FontSize = 16;
            app.aLabel.Position = [28 142 31 25];
            app.aLabel.Text = 'a : ';

            % Create bLabel
            app.bLabel = uilabel(app.UIFigure);
            app.bLabel.FontSize = 16;
            app.bLabel.Position = [122 143 27 22];
            app.bLabel.Text = 'b : ';

            % Create rLabel
            app.rLabel = uilabel(app.UIFigure);
            app.rLabel.FontSize = 16;
            app.rLabel.Position = [221 143 25 22];
            app.rLabel.Text = 'r : ';

            % Create a
            app.a = uilabel(app.UIFigure);
            app.a.BackgroundColor = [1 1 1];
            app.a.FontSize = 14;
            app.a.Position = [58 142 57 25];
            app.a.Text = '        ';

            % Create b
            app.b = uilabel(app.UIFigure);
            app.b.BackgroundColor = [1 1 1];
            app.b.FontSize = 14;
            app.b.Position = [148 142 66 25];
            app.b.Text = '        ';

            % Create r
            app.r = uilabel(app.UIFigure);
            app.r.BackgroundColor = [1 1 1];
            app.r.FontSize = 16;
            app.r.Position = [245 143 60 24];
            app.r.Text = '        ';
        end
    end

    methods (Access = public)

        % Construct app
        function app = regression

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
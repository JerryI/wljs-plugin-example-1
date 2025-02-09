let ApexCharts;

core.ApexCharts = async (args, env) => {
    if (!ApexCharts) ApexCharts = (await import('./apexcharts.esm-1f6f835c.js')).default; //lazy loading

    const options = await interpretate(args[0], env);
    const chart = new ApexCharts(env.element, options);
    chart.render();

    env.local.chart = chart;
};

core.ApexCharts.destroy = (args, env) => {
    env.local.chart.destroy();
}; 

core.ApexCharts.virtual = true;

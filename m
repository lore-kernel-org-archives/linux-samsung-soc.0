From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v6 08/18] cpufreq: exynos: Use device tree to determine if
 cpufreq cooling should be registered
Date: Fri, 23 Jan 2015 18:29:17 +0530
Message-ID: <CAKohpok1EacvJ3PCOZYnz81D3=P04apRp7VOxPFE1QxYF4Wydg@mail.gmail.com>
References: <1421666462-7606-1-git-send-email-l.majewski@samsung.com>
	<1422015260-14225-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1422015260-14225-1-git-send-email-l.majewski@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>, Linux PM list <linux-pm@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lukasz Majewski <l.majewski@majess.pl>, Kukjin Kim <kgene.kim@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Kukjin Kim <kgene@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 23 January 2015 at 17:44, Lukasz Majewski <l.majewski@samsung.com> wrote:
> +       cpus = of_find_node_by_path("/cpus");
> +       if (!cpus) {
> +               pr_err("failed to find cpus node\n");
> +               return 0;
> +       }
> +
> +       np = of_get_next_child(cpus, NULL);
> +       if (!np) {
> +               pr_err("failed to find cpus child node\n");
> +               of_node_put(cpus);
>                 return 0;
> +       }

Why making it complex? Just get device node for cpu 0 and
do cpu_dev->np.

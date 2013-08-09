From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v5 2/4] mmc: dw_mmc: Add exynos resume_noirq callback to
 clear WAKEUP_INT
Date: Fri, 9 Aug 2013 13:41:58 -0300
Message-ID: <CAOMZO5DZ=aJsOvTyrKL=57_jGMGQX8k3mDamgXqnF-9Ou2fpAg@mail.gmail.com>
References: <1375825071-20922-1-git-send-email-dianders@chromium.org>
	<1376066000-5495-1-git-send-email-dianders@chromium.org>
	<1376066000-5495-3-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1376066000-5495-3-git-send-email-dianders@chromium.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Chris Ball <cjb@laptop.org>, linux-samsung-soc@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Seungwon Jeon <tgih.jun@samsung.com>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-mmc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>, Grant Grundler <grundler@chromium.org>, Kukjin Kim <kgene.kim@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Aug 9, 2013 at 1:33 PM, Doug Anderson <dianders@chromium.org> wrote:

> +#else
> +#define dw_mci_exynos_suspend          NULL
> +#define dw_mci_exynos_resume           NULL
> +#define dw_mci_exynos_resume_noirq     NULL
> +#endif /* CONFIG_PM_SLEEP */

You could avoid this else block if you use 'static SIMPLE_DEV_PM_OPS' below.

> +
>  static void dw_mci_exynos_prepare_command(struct dw_mci *host, u32 *cmdr)
>  {
>         /*
> @@ -187,13 +234,20 @@ static int dw_mci_exynos_probe(struct platform_device *pdev)
>         return dw_mci_pltfm_register(pdev, drv_data);
>  }
>
> +const struct dev_pm_ops dw_mci_exynos_pmops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(dw_mci_exynos_suspend, dw_mci_exynos_resume)
> +       .resume_noirq = dw_mci_exynos_resume_noirq,
> +       .thaw_noirq = dw_mci_exynos_resume_noirq,
> +       .restore_noirq = dw_mci_exynos_resume_noirq,
> +};

static SIMPLE_DEV_PM_OPS(dw_mci_exynos_pmops, dw_mci_exynos_suspend,
 dw_mci_exynos_resume ) ;

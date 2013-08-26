From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH RFC 4/5] clk: samsung: Add clock driver for s5pc110/s5pv210
Date: Mon, 26 Aug 2013 19:12:35 +0200
Message-ID: <1433697.46kixytlq2@amdc1032>
References: <1377517114-20222-1-git-send-email-m.krawczuk@partner.samsung.com>
 <1377517114-20222-5-git-send-email-m.krawczuk@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1377517114-20222-5-git-send-email-m.krawczuk@partner.samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Cc: kgene.kim@samsung.com, kyungmin.park@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, rob@landley.net, mturquette@linaro.org, thomas.abraham@linaro.org, t.stanislaws@samsung.com, m.chehab@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Monday, August 26, 2013 01:38:33 PM Mateusz Krawczuk wrote:
> This patch adds new, Common Clock Framework-based clock driver for Samsung
> S5PV210 SoCs. The driver is just added, without enabling it yet.
> 
> Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> ---
>  .../bindings/clock/samsung,s5pv210-clock.txt       |  72 ++
>  drivers/clk/samsung/Makefile                       |   3 +-
>  drivers/clk/samsung/clk-s5pv210.c                  | 732 +++++++++++++++++++++
>  include/dt-bindings/clock/samsung,s5pv210-clock.h  | 221 +++++++
>  4 files changed, 1027 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.txt
>  create mode 100644 drivers/clk/samsung/clk-s5pv210.c
>  create mode 100644 include/dt-bindings/clock/samsung,s5pv210-clock.h

[...]

> diff --git a/drivers/clk/samsung/clk-s5pv210.c b/drivers/clk/samsung/clk-s5pv210.c
> new file mode 100644
> index 0000000..861d37d
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-s5pv210.c

[...]

> +static unsigned long s5pv210_get_xom(void)

This function can be marked with __init.

> +{
> +	unsigned long xom = 1;
> +	void __iomem *chipid_base;
> +	struct device_node *np;
> +
> +	np = of_find_compatible_node(NULL, NULL, "samsung,s5pv210-chipid");
> +	if (np) {
> +		chipid_base = of_iomap(np, 0);

How's about printing an error if !chipid_base?

Also the code can be made a bit shorter:

if (np) {
	void __iomem *chipid_base = of_iomap(np, 0);
...
}

> +		if (chipid_base)
> +			xom = readl(chipid_base + 8);
> +
> +		iounmap(chipid_base);

It seems that at least generic iounmap() accepts NULL argument but it 
will be better not to call it if of_iomap() failed.

> +	}
> +
> +	return xom;
> +}

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics


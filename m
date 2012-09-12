From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v2] ARM: EXYNOS: Add MFC device tree support
Date: Wed, 12 Sep 2012 22:24:31 +0200
Message-ID: <5050EF7F.9040802@gmail.com>
References: <1347456857-27584-1-git-send-email-arun.kk@samsung.com> <1347456857-27584-2-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:55363 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751489Ab2ILUYg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Sep 2012 16:24:36 -0400
Received: by bkwj10 with SMTP id j10so131900bkw.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Sep 2012 13:24:35 -0700 (PDT)
In-Reply-To: <1347456857-27584-2-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, thomas.abraham@linaro.org, k.lewandowsk@samsung.com, ch.naveen@samsung.com, joshi@samsung.com

Just a few small comments...

On 09/12/2012 03:34 PM, Arun Kumar K wrote:
> This patch adds device tree entry for MFC v6 in the Exynos5
> SoC. Makes the required changes in the clock files and adds
> MFC to the DT device list.
>
> Signed-off-by: Naveen Krishna Chatradhi<ch.naveen@samsung.com>
> Signed-off-by: Arun Kumar K<arun.kk@samsung.com>
> ---
...
> diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
> new file mode 100644
> index 0000000..9a74d09
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
> @@ -0,0 +1,27 @@
> +* Samsung Multi Format Codec (MFC)
> +
> +Mult Format Codec (MFC) is the IP present in Samsung SoCs which

Mult -> Multi

> +supports high resolution decoding and encoding functionalities.
> +The MFC device driver is a v4l2 driver which can encode/decode
> +video raw/elementary streams and has support for all popular
> +video codecs.
> +
> +Required properties:
> +  - compatible : value should be either one among the following
> +	(a) "samsung,mfc-v5" for MFC v5 present in Exynos4 SoCs
> +	(b) "samsung,mfc-v6" for MFC v6 present in Exynos5 SoCs
> +
> +  - reg : Physical base address of the IP registers and length of memory
> +	  mapped region.
> +
> +  - interrupts : MFC interupt number to the CPU.

interupt -> interrupt

> +
> +  - samsung,mfc-r : Base address of the first memory bank used by MFC
> +		    for DMA contiguous memory allocation.
> +
> +  - samsung,mfc-r-size : Size of the first memory bank.
> +
> +  - samsung,mfc-l : Base address of the second memory bank used by MFC
> +		    for DMA contiguous memory allocation.
> +
...
> +struct mfc_dt_meminfo {
> +	unsigned long loff;
> +	unsigned long lsize;
> +	unsigned long roff;
> +	unsigned long rsize;
> +};
> +
> +int fdt_find_mfc_mem(unsigned long node, const char *uname, int depth,
> +		void *data)
> +{
> +	__be32 *prop;
> +	unsigned long len;
> +	struct mfc_dt_meminfo *mfc_mem = (struct mfc_dt_meminfo *)data;

No need for explicit cast from void *.

> +	if (of_flat_dt_is_compatible(node, "samsung,mfc-v6")) {

Might be worth to change it to

	if (!of_flat_dt_is_compatible(node, "samsung,mfc-v6"))
		return 0;

and avoid indentation.
> +		prop = of_get_flat_dt_prop(node, "samsung,mfc-l",&len);
> +		if (!prop)
> +			return 0;
> +		mfc_mem->loff = of_read_ulong(prop, len/4);
> +
> +		prop = of_get_flat_dt_prop(node, "samsung,mfc-l-size",&len);
> +		if (!prop)
> +			return 0;
> +		mfc_mem->lsize = of_read_ulong(prop, len/4);
> +
> +		prop = of_get_flat_dt_prop(node, "samsung,mfc-r",&len);
> +		if (!prop)
> +			return 0;
> +		mfc_mem->roff = of_read_ulong(prop, len/4);
> +
> +		prop = of_get_flat_dt_prop(node, "samsung,mfc-r-size",&len);
> +		if (!prop)
> +			return 0;
> +		mfc_mem->rsize = of_read_ulong(prop, len/4);
> +
> +		return 1;
> +	}
> +	return 0;
> +}

--
Regards,
Sylwester

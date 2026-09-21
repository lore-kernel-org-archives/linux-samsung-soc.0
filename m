Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DD74CA78F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2026 18:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015366; cv=none; b=dhOm+Ofc7gtSTxemYkdpP1UWRT4e3ntaSMKvY+1jHaLoMwcbO90FpTEP2dFFvStG7TdGh97PgV6eEW6qMh70jlodQyS404nHhi2IjGuVdntg88+edJSYZR/Zs4/iupcBliz2v58kYAcO3QFwfXidi45IrQU/pFxpg1H+9yV6eFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015366; c=relaxed/simple;
	bh=vHLcczVG0u5/7NzvBvHE9sbFAGBbTxZPZu97ylHOl4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qp4pViJVfUMp0NgNQa4hqTmKFbtaGH23Cb8QJcWou3F5lUYmuZ3HeRNdGLRhr18tkpvjipmCuKVrQ6ZxvfHLlHYL7WjteYq+JSzMz9HqXv41ii0TccFoDx0hv3QlIHci0/pdeB2tP+2KzajHZc7ruNFtmIyY2LgPuFqtJXtZeJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LIMynF+S; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LIMynF+S"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6d122cf9224so278480eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2026 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790015363; x=1790620163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zBEpExP60BKwR+80aEYT0motmzonf8fi0uI5o05psGA=;
        b=LIMynF+SHwEz1x90yjJCnq1/rRfdWpdI8Wd2IU5EuIALeA25em/NvjgdXV4t6f2c57
         rkdEX423g7arh4CWBEJIZTi9nXJBktWJgM4zT2DR65qoGyevDnxq4ivkOIvIADQw7blN
         Lvqva3zUaWJJXy6miGC1dFlJfMyaKDZl3wxAVQih1aqHFi24s8xX5ekBwRxMPW9OvKkw
         aF1YmYBSmJ+9w9Pht/pkQNLWsIp4iW2TghP4cO4ZrJAXss5xAAzmSgrwi0+c9CJ1Lidq
         70PeVjg4uAxqN5Fr+uFtvqW/UDMC4wYTi9u8JThYjDuq0frL/Lg+6UZn6sJD4LT1xRci
         2ooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015363; x=1790620163;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBEpExP60BKwR+80aEYT0motmzonf8fi0uI5o05psGA=;
        b=qa0T7yWO36jPCwq5Lyb2gezIzt+hWCMPhtsgwoP0X4QbrISrf+MVuXXsPXHQNl8ZV8
         wF5JX2qwljnhZE+Zrx8o4nAfJdLmLQQPvQYj/ri87FbETxMxVFZ9SmQDn0H5QOpOnEWj
         YD2eq90IDz8RPNRAues2OanXnxFFW6wZ3hNx7ua8NvoLq2uPZddxLbB7njjwVOx1tlHt
         AMXXRcdRKBUh9DkK4Upgdj/YohJcoyBTbqxpzV0ybxfJ9M0f3NpM0VxR51i3i1pAA1Dj
         fJ1kUq4wJyu7eT3ueHZ8wIId+aA592vhJKjPcl4GvN3oIgRgXJze+M4w73kABrvpdqOj
         rGdA==
X-Forwarded-Encrypted: i=1; AKwUvBzWxBykMGkR4y0k8ZYQZ7YpJbmGMhAljGDqTHo833EtNhs7DecMzgWPvvtnZHV9rl5MQUMjWkYBJp6qT5Z4ONDZEw==@vger.kernel.org
X-Gm-Message-State: AFuF++m4u0BTnAt7SycpyZ9fpTbIzfKfMASBWZV5OKWbynQyIFVRjuCg
	AqlaIbzgXBnjfSgz3Y91T+OlbQnbMSAnIhODJ9KoT4LKy/3O5cD64ftGRy/ILDJkig==
X-Gm-Gg: AYBFou2TDJd/mHC8C8rDOclBusWRYNRTFvKf/aB/0G896gPONRcJZaur4vZRQyIXbcT
	XKzFH73v5ablL9JCxSVK8hWFNEfZjydRf762jiqjrYt9i70WwXlK1NPqcKQ5LVu5WjVhxXCFsci
	nB3WVecXWkKUlJOVTrR9HQvi+Piuj+r84cQWz4zU3lude0L2w3KNurwDNEQX7WmGTg8QDhIJ5us
	T7RMGzG5AYUwsrOhxxiNJBxbf2/f+MD8dF43jk77VkG/+E80tAD//+XtAk0La7KqrV14skDI3pS
	DhRyOYlbC1ExKrdSGm+2e7S+BdpJ8xXJNqDwSjestYQGxsRLleJjJqi0YUGv92PY/LoZwnUodFO
	beKcgU+0VtKJWwNAg5N9CnHTfPgGL6AifPHniZ7rXI9IosLM5mOZp6FDWuCaAfZ+3Kp7bSm+5GW
	O4tZtv1DGBB4HXXV1HY/Ij1fSDLYWfLaUjZAtnaxDG9Oy0IXAx7z8kWxEz4LWYVRkGhZM7gbyI5
	MmUwaEZdB43g52C15x7eTZOVsR5elQc/QaB
X-Received: by 2002:a05:6820:607:b0:6c2:c9:2c76 with SMTP id 006d021491bc7-6ca9a85289amr10091458eaf.16.1790015362272;
        Mon, 21 Sep 2026 11:29:22 -0700 (PDT)
Received: from google.com (222.97.173.34.bc.googleusercontent.com. [34.173.97.222])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d181ae5a14sm26230eaf.3.2026.09.21.11.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:29:21 -0700 (PDT)
Date: Mon, 21 Sep 2026 18:29:19 +0000
From: Neill Kapron <nkapron@google.com>
To: RD Babiera <rdbabiera@google.com>
Cc: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org,
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de,
	neil.armstrong@linaro.org, badhri@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] phy: Add USB3 PHY support to Google Tensor SoC USB
 PHY driver
Message-ID: <arF3fynAGG5khe3B@google.com>
References: <20260918222513.2633456-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918222513.2633456-2-rdbabiera@google.com>

Hi RD,

Thanks for sending v7. I've reviewed the changes and identified a few
functional issues, and a couple minor items as seen below:


On Fri, Sep 18, 2026 at 10:25:14PM +0000, RD Babiera wrote:
> Add USB3 PHY support for the Google Tensor G5 USB PHY driver.
...
> --- a/drivers/phy/phy-google-usb.c
> +++ b/drivers/phy/phy-google-usb.c
> @@ -20,6 +20,7 @@
>  #include <linux/reset.h>
>  #include <linux/usb/typec_mux.h>

The driver is now using readl_poll_timeout() and
pm_runtime_get_if_active(), we should be including linux/iopoll.h and
linux/pm_runtime.h explicitly.

> +#define TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS 0x1e85
> +#define TCA_PSTATE_0_OFFSET 0x50
> +#define TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS BIT(8)
> +
> +#define GPHY_TCA_DELAY_US 10
> +#define GPHY_TCA_TIMEOUT_US 100000

With the addition of TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS, we
should consider bumping GPHY_TCA_TIMEOUT_US to be slightly larger (e.g.
110000us) to ensure the hardware timeout is guaranteed to expire before
the software poll timeout.

> +static const char * const u2phy_clk_names[] = {
> +	"usb2",
> +	"usb2_apb",
> +};
> +static const char * const u3phy_clk_names[] = {
> +	"usb3"
> +};
> +static const char * const u2phy_rst_names[] = {
> +	"usb2",
> +	"usb2_apb",
> +};
> +static const char * const u3phy_rst_names[] = {
> +	"usb3"
> +};

nit: checkpatch.pl --strict flags missing blank lines between these
array declarations (and the inline helper functions + DEFINE__FREE
macros below).

> +
> +static const struct google_usb_phy_config phy_configs[GOOGLE_USB_PHY_NUM] = {
> +	[GOOGLE_USB2_PHY] = {
> +		.clk_names = u2phy_clk_names,
> +		.num_clks = ARRAY_SIZE(u2phy_clk_names),
> +		.rst_names = u2phy_rst_names,
> +		.num_rsts = ARRAY_SIZE(u2phy_rst_names),
> +	},
> +	[GOOGLE_USB3_PHY] = {
> +		.clk_names = u3phy_clk_names,
> +		.num_clks = ARRAY_SIZE(u3phy_clk_names),
> +		.rst_names = u3phy_rst_names,
> +		.num_rsts = ARRAY_SIZE(u3phy_rst_names),
> +	},
> +};
> +
> +static inline void google_usb_phy_clk_disable(struct google_usb_phy_instance *inst)
> +{
> +	clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> +}
> +DEFINE_FREE(inst_clk_disable, struct google_usb_phy_instance *,
> +	    if (_T) google_usb_phy_clk_disable(_T))
> +
> +static inline void google_usb_phy_rst_disable(struct google_usb_phy_instance *inst)
> +{
> +	reset_control_bulk_assert(inst->num_rsts, inst->rsts);
> +}
> +DEFINE_FREE(inst_rst_disable, struct google_usb_phy_instance *,
> +	    if (_T) google_usb_phy_rst_disable(_T))
> +
...
>   
>  static int google_usb_set_orientation(struct typec_switch_dev *sw,
>  				      enum typec_orientation orientation)
>  {
>  	struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
> +	int ret = 0;
>  
>  	dev_dbg(gphy->dev, "set orientation %d\n", orientation);
>  
> -	gphy->orientation = orientation;
> +	guard(mutex)(&gphy->phy_mutex);
>  
> -	if (pm_runtime_suspended(gphy->dev))
> -		return 0;
> +	gphy->orientation = orientation;
>  
> -	guard(mutex)(&gphy->phy_mutex);
> +	if (IS_ENABLED(CONFIG_PM)) {
> +		if (pm_runtime_get_if_active(gphy->dev) <= 0)
> +			return 0;
> +	}
>  
>  	set_vbus_valid(gphy);
>  
> -	return 0;
> +	if (gphy->phy_state == COMBO_PHY_TCA_READY && orientation != TYPEC_ORIENTATION_NONE)
> +		ret = program_tca_locked(gphy);
> +
> +	pm_runtime_put(gphy->dev);
> +
> +	return ret;
>  }

Previously, sashiko recommended moving to pm_runtime_get_if_active(),
which was done in v6. However I think this may have changed the behavior
of google_usb_set_orientation() and potentially introduced a regression
due to the pre-existing ordering of calls in gooogle_usb_phy_probe(),
causing this function to always take the early 'return 0' path.

In google_usb_phy_probe(), we call devm_phy_create() prior to calling
pm_runtime_enable(dev).

In drivers/phy/phy-core.c, devm_phy_create() calls phy_create(), which
has the following check:

    if (pm_runtime_enabled(dev)) {
        pm_runtime_enable(&phy->dev);
        pm_runtime_no_callbacks(&phy->dev);
    }

Therefore, the phy device never has pm_runtime_enabled, causing this
call to pm_runtime_get_if_active() to always return 0, and the function
exits prior to calling `set_vbus_valid()`.

I think moving the pm_runtime_enable(dev) call prior to
devm_phy_create() will resolve the issue, but we should audit power
managment in this driver to verify.

> 
> +static int google_usb3_phy_init(struct phy *_phy)
> +{
> +	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> +	struct google_usb_phy *gphy = inst->parent;
> +	int ret = 0;
> +	u32 reg;
> +
> +	dev_dbg(gphy->dev, "initializing usb3 phy\n");
> +
> +	guard(mutex)(&gphy->phy_mutex);
> +
> +	if (gphy->phy_state != COMBO_PHY_IDLE) {
> +		dev_warn(gphy->dev, "usb3 phy init called when combo phy state is not idle\n");
> +		return 0;
> +	}
> +
> +	reg = readl(gphy->usb3_tca_base + TCA_CTRLSYNCMODE_CFG1_OFFSET);
> +	reg &= ~TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL;
> +	reg |= FIELD_PREP(TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL,
> +			  TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS);
> +	writel(reg, gphy->usb3_tca_base + TCA_CTRLSYNCMODE_CFG1_OFFSET);

I think this introduces a regression between v6 and v7, as usb3_tca_base
may be accessed prior to the 'usb3' clock being enabled, and
furthermore, the call to reset_control_bulk_deassert() will clear this
value.

Therefore, I think we need to this after the call to
reset_control_bulk_deassert().

> +
> +	reg = readl(gphy->usbdp_top_base + PHY_POWER_CONFIG_REG1_OFFSET);
> +	reg |= PHY_POWER_CONFIG_REG1_PG_MODE_EN;
> +	reg &= ~PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG;
> +	reg |= FIELD_PREP(PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG,
> +			  (UPCS_PIPE_CONFIG_ISO_CPM |
> +			   UPCS_PIPE_CONFIG_PG_MODE_STATIC |
> +			   UPCS_PIPE_CONFIG_LANE_RESET_NO_PG_EXIT));
> +	writel(reg, gphy->usbdp_top_base + PHY_POWER_CONFIG_REG1_OFFSET);
> +
> +	set_vbus_valid(gphy);
> +
> +	reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +	reg |= USBCS_PHY_CFG1_PHY0_MPLLA_SSC_EN;
> +	writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +
> +	set_sram_bypass(gphy, SRAM_BYPASS_MODE_BYPASS_FIRMWARE |
> +			SRAM_BYPASS_MODE_BYPASS_CONTEXT);
> +	set_pmgt_ref_clk_req_n(gphy, true);
> +	struct google_usb_phy *pmgt_ref_clk_req_dev __free(pmgt_ref_clk_req_n) = gphy;
> +
> +	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
> +	if (ret)
> +		return ret;
> +	struct google_usb_phy_instance *clk_dev __free(inst_clk_disable) = inst;
> +
> +	ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
> +	if (ret)
> +		return ret;
> +	struct google_usb_phy_instance *rst_dev __free(inst_rst_disable) = inst;
> +
> +	ret = readl_poll_timeout(gphy->usb3_tca_base + TCA_PSTATE_0_OFFSET,
> +				 reg, !(reg & TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS),
> +				 GPHY_TCA_DELAY_US, GPHY_TCA_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(gphy->dev, "wait for lane0 phystatus timed out\n");
> +		return ret;
> +	}
> +
> +	gphy->phy_state = COMBO_PHY_INIT_DONE;
> +
> +	retain_and_null_ptr(rst_dev);
> +	retain_and_null_ptr(clk_dev);
> +	retain_and_null_ptr(pmgt_ref_clk_req_dev);
> +
> +	return 0;
> +}
> +
> 
>

Thanks,
Neill

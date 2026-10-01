Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2672F8E95
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Oct 2026 11:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855160; cv=pass; b=t1QxFbsoM2QlUEKQITQrOp2nhYUovfUMmPNr8ruyRa01ogtcOlMfh+XkKo1wMgagfCKslQlCwtcE4I5v6ijV3FK6XjB0xYno+yLu4T5ZoPR572v5vRJ564gUWL5fg7XN9aO+LpQX3k7X4BiIfrgiaxD9qNQ+jA+QLhWxB/CIap8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855160; c=relaxed/simple;
	bh=Z+y0BgPxn6Bnxv+J/d8CO0rCdex/vNKDbU+RGbOF2bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXOXG50w/EX45qt6j1PsUZx7Z8aTvKXHhBX20nhqp5g0MSqdiYIkyU22+igEnDnDl7YkrQte83mcGJjc754JENnGggQLjjqfceZjwVT/TaDFD/8r0Cbd4T1KalrSC0PweaNd4x+rM4aYLBfL1L90Nn05h5p9MM86Vm2u/hRlmdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=alFqx6tz; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="alFqx6tz"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso9791300a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Oct 2026 04:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790855146; cv=none;
        d=google.com; s=arc-20260327;
        b=TUbZ0WZCzyeE8+zSKp3yqK6+rcpQZJIymgoNaYkdjnUsR6vRuDVghKd6iNsfq6sEn5
         En5s8HvqlGcOzKtcLuxdB+/56l2IUTYm4/i4XwgbSvOApaHMWuwWsL2pmfTlQnxB+rqZ
         iEpjL/iC9LLOV0h0wL4I/s0Dj7PY3gAtXDtVLUzMUNNZPoUXOoEdd4rcihCdgdAOWgLY
         YLLhEMZXLUm+yDWXbedhPs/4ycCA9aMYnejkrulLDNArEe09Q9w1hGqu94oABAbzCQcI
         W/+VhJOGAAeM9W+KAubiRXPUHUBe9GH0z0lhHhM/4KDJnHq8ELwnvmi/9T9qIkDe92t4
         I/+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9vaT1r+UkRQ9frjkUsIiEb8tP1FGw7pwyqFfm7QQnxU=;
        fh=C2WIknh9fM8x0ZxYtYqAh8rfsdccfJ0ctHyxP9Ze804=;
        b=TFktf0cU/RpsrkWSy1acZnv8AR5XOCJAFC/JKcIRXAkDvGOG0vYBy+sEr03+XQy2kl
         mBbTMfTdZ519URcXj6om5TuocBAUMhnsBi1NwrVNxKbNXQVJLjR7ybh4UlKueXxmJ7/d
         iM3LOfnjSJvj6eJHv7UghiM3I5cg24UN0xRYcXNEjchZRCie3llXwozas3aOserrn+wd
         AC67yQRGrPAB8BK+bprGxvL3PI39suupfHvfbxp4cjIvD2VYVaF+WsLcW8pzYbtiV+S4
         BQlu+LbG5r8PqF1VfdcMuew9nSbS98BOYUTmjRsx6FxOUQAA4FZ4MtH6k2DmjqdWtmFt
         UsqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790855146; x=1791459946; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9vaT1r+UkRQ9frjkUsIiEb8tP1FGw7pwyqFfm7QQnxU=;
        b=alFqx6tzAzKJRJMvUaVLupbuqwamJRfEQG/EjDhjgHFjr9KUFwmbVi9BS0UW5fph68
         F9p+BhAGcE36PZ5/dik5aeXzQpp8txI32E223b99VF6CYc9aH3KV66Klf62l0wuuztbT
         MufX/r0EBNnqISehyn5JBY0PFy/A/lrupOg+cIHSeRJ4Sx9HQJBn6OzllhG2SUgXXcWi
         0txSGcx03AmKZakrN6AqC4ZV23wMmrfQERJC4aQARC23SgBdqph8r9Vy4GHnlx6PBn4s
         LlflmsAd557N4tYIFYeCqBB/EjH6XHWTXgtEFmxfUnctbU/7p5wnvMAyvqMAJtkXgNR6
         v30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855146; x=1791459946;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9vaT1r+UkRQ9frjkUsIiEb8tP1FGw7pwyqFfm7QQnxU=;
        b=pHTDzPzm3lzBpmz+3SSooQo/MPr0i53xhxZgLPmMIsPHygeWjawAAaWc35zhspQ9sH
         tj0fTuGfNEMbA7OAXM4rKHia8N6Y2vIuW78SIbVlUu49y1FinX/AeuozW5ng26sQOob2
         XlXB/BBjgFhzn9Fxf6v7+LKshTtDy4cLFBDr61E02WVpH7pCfZvdquomrxBpkmokxHGl
         ca9jHg0WFI36RXN6f6FutNHDH+iRdMWgnsPxl8JoF6OqSM44p0NsuRGXk2EPaMZdN3JO
         BMy9okk231PgZaVGvIuBvGLkgl1D0Kdj4qBBGhEcjlMqrB1lgOVPOYimcU7v1T81/eTc
         7rSA==
X-Forwarded-Encrypted: i=1; AKwUvByizVNYZ3w+x5ms/8IX0uqUGfwIeZzlHKTBaJ1jBvEU2ez9etce9Uw3QIsGAUJH/8BC8KuH+EEbSfUh2/J3l3F83Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJim3taUAHa6Cstq9th+QPzZPN5jtwIweD/gv14Udw3taIj6RYP
	kNFLhngzs532yqDl0Ps937sQEh6wVcgBWBrqa46ievxfYYSEznMyBtyjtm1FpHSw559Wwqrenyp
	FaTZ7RzhETn4KGzvjZEG9LysAaEvWtarWu42tic212umOeWvsEtWM8rs=
X-Gm-Gg: AYBFou2usy7KXHlUHUbfvK03U4J98mKeOXDw/hN3bh04IWKu9Blt2XEA+B9Ok+oMtQi
	2sjiRnVe19JxfFvQTNSl1XCb+A9N9ffdVPJ8sSM0IDsD5vTKpMOn7Z/jNYHbbbYt1Pnp2IRZvrL
	GBvwA80R3GkknzqmuQo212sPxGOcLQz3Zqi//tqG9SxNOj3lNKGPttap/kyt4FnleMaDt5/DTab
	DYhgMI0w3ZhdvtbcZ65G9Najk2or55gb2BHF1G7zLMHfAC0gmKOSggFCb+aeav/mq/oFzpz0aQ3
	stKoCPTCNoQeiXhZPt4cE0EZt1KUAk3ljwEihmkrCOOrRX0YPsEvEKqIaGywUefttY9aDCk9/SS
	P1+YKkiAqXUZg/WI=
X-Received: by 2002:a05:6402:4244:10b0:6ae:231d:5b04 with SMTP id
 4fb4d7f45d1cf-6ae231d5f6cmr2443234a12.34.1790855145707; Thu, 01 Oct 2026
 04:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925222959.3607769-2-rdbabiera@google.com>
In-Reply-To: <20260925222959.3607769-2-rdbabiera@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 1 Oct 2026 12:45:33 +0100
X-Gm-Features: AclHuK894a9mH0wxTgrH_ipYnE4vTzJB_Zx5PNoCbbgWS97eFldmJSZCTR0eUZE
Message-ID: <CADrjBPrAHtpeVsuaTdJQ-bkf7s61-NViTBe+461d+Cwg0C9h=w@mail.gmail.com>
Subject: Re: [PATCH v8] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
To: RD Babiera <rdbabiera@google.com>
Cc: vkoul@kernel.org, andre.draszik@linaro.org, tudor.ambarus@linaro.org, 
	p.zabel@pengutronix.de, neil.armstrong@linaro.org, badhri@google.com, 
	nkapron@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Sept 2026 at 23:30, RD Babiera <rdbabiera@google.com> wrote:
>
> Add USB3 PHY support for the Google Tensor G5 USB PHY driver.
> This patch adds functionality for the usb3_tca register, usb3 clock,
> and usb3 reset as defined in google,lga-usb-phy.yaml. Kconfig now lists
> USB SuperSpeed support.
>
> Refactor the probe sequence to initialize the USB2 and USB3 PHYs, and then
> initialize clocks and resets for both PHYs afterwards.
>
> Refactor set_vbus_valid to reduce duplicated code.
>
> Implement USB3 phy_ops for phy_init, phy_exit, and phy_power_on.
> combo_phy_state enum is added to track PHY bringup state across
> PHY API calls. google_usb_set_orientation can reprogram the TCA when the
> PHY is ready.
>
> google_usb_set_orientation now calls pm_runtime_get_if_active to
> guarantee register access. Setting orientation and pm_runtime management
> are now handled within phy_mutex.
>
> Signed-off-by: RD Babiera <rdbabiera@google.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Changes since v1:
> * Removed mix of goto-based and scope-based cleanup from usb3 phy_init
> * Removed unused usb3_core resource from probe
> * Added combo_phy_state enum to interally track ComboPHY bringup state
>   to allow google_usb_set_orientation() to change TCA orientation.
> * Modify Kconfig documentation to reflect SuperSpeed support
>
> Changes since v2:
> * google_usb3_phy_init now sets USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N
>   to false if phy_init fails elsewhere.
> * google_usb3_phy_init errors are now handled via DEFINE_FREE structures.
>   This affects set_pmgt_ref_clk_req_n, clk_bulk_prepare_enable, and
>   reset_control_bulk_deassert.
> * google_usb2_phy_init also handles undoing clk_bulk_prepare_enable via
>   DEFINE_FREE structure.
> * google_usb3_phy_power_on allows program_tca_locked in the
>   COMBO_PHY_TCA_READY state. Waiting for PoR=>NC is only performed once.
> * Note: there are checkpatch errors for the DEFINE_FREE macros resulting
>   in "ERROR: trailing statements should be on next line". Other cases of
>   DEFINE_FREE where the line limit would otherwise exceed 100 columns
>   have the indentation done the same way.
>
> Changes since v3:
> * set_pmgt_ref_clk_req_n(false) in google_usb3_phy_exit() comes after
>   reset assertion and clock disable to match phy_init() sequence.
> * program_tca_locked in usb3 power_on() now requires a valid orientation
>   to match google_usb_set_orientation requirements.
>
> Changes since v4:
> * google_usb_set_orientation sets gphy->orientation while holding
>   phy_mutex.
> * google_usb_set_orientation now holds a pm_runtime reference before
>   checking for suspend, and calls put_autosuspend prior to normal
>   exit.
>
> Changes since v5:
> * google_usb_set_orientation replaces pm_runtime_suspended check with
>   pm_runtime_get_if_active call.
>
> Changes since v6:
> * google_usb_set_orientation uses pm_runtime_put() instead of
>   pm_runtime_put_autosuspend().
> * Added newline to all dev_* logs
> * xa_ack sw poll changed to 100ms, and xa_timeout_val is programmed
>   to match during usb3 phy init
> * google_usb3_phy_power_on returns -EINVAL when PHY is idle and
>   only performs PoR->NC wait in COMBO_PHY_INIT_DONE
>
> Changes since v7:
> * Explicitly include linux/iopoll.h and linux/pm_runtime.h.
> * Bump GPHY_TCA_TIMEOUT_US to 110ms so the 100ms hardware xa_timeout
> expires before the software poll.
> * Add blank lines flagged by checkpatch --strict.
> * Change pm_runtime_enable() to devm_pm_runtime_enable(), removing
> pm_runtime_disable() from driver remove() and fixing missing disable
> call from typec_switch_register() error path.
> ---
>  drivers/phy/Kconfig          |   2 +-
>  drivers/phy/phy-google-usb.c | 447 +++++++++++++++++++++++++++++++----
>  2 files changed, 404 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 19f3b7d12b7d..d2d401129af7 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -100,7 +100,7 @@ config PHY_GOOGLE_USB
>           the G5 generation (Laguna). This driver provides the PHY interfaces
>           to interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY,
>           both of which are integrated with the DWC3 USB DRD controller.
> -         This driver currently supports USB high-speed.
> +         This driver currently supports USB high-speed and SuperSpeed.
>
>  config USB_LGM_PHY
>         tristate "INTEL Lightning Mountain USB PHY Driver"
> diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
> index ab20bc20f19e..70d3a3833948 100644
> --- a/drivers/phy/phy-google-usb.c
> +++ b/drivers/phy/phy-google-usb.c
> @@ -9,6 +9,7 @@
>  #include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> @@ -16,10 +17,12 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/usb/typec_mux.h>
>
> +/* USB_CFG_CSR */
>  #define USBCS_USB2PHY_CFG19_OFFSET 0x0
>  #define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
>
> @@ -28,11 +31,44 @@
>  #define USBCS_USB2PHY_CFG21_REF_FREQ_SEL GENMASK(15, 13)
>  #define USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL BIT(19)
>
> +/* USBDP_TOP */
>  #define USBCS_PHY_CFG1_OFFSET 0x28
> +#define USBCS_PHY_CFG1_PHY0_MPLLA_SSC_EN BIT(1)
> +#define USBCS_PHY_CFG1_PHY0_SRAM_BYPASS_MODE GENMASK(11, 10)
> +#define SRAM_BYPASS_MODE_BYPASS_FIRMWARE BIT(0)
> +#define SRAM_BYPASS_MODE_BYPASS_CONTEXT BIT(1)
>  #define USBCS_PHY_CFG1_SYS_VBUSVALID BIT(17)
>
> +#define USBDP_TOP_CFG_REG_OFFSET 0x44
> +#define USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N BIT(0)
> +
> +#define PHY_POWER_CONFIG_REG1_OFFSET 0x48
> +#define PHY_POWER_CONFIG_REG1_PG_MODE_EN BIT(1)
> +#define PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG GENMASK(31, 14)
> +#define UPCS_PIPE_CONFIG_ISO_CPM BIT(5)
> +#define UPCS_PIPE_CONFIG_PG_MODE_STATIC BIT(6)
> +#define UPCS_PIPE_CONFIG_LANE_RESET_NO_PG_EXIT BIT(9)
> +
> +/* USB3_TCA */
> +#define TCA_INTR_STS_OFFSET 0x8
> +#define TCA_INTR_STS_XA_ACT_EVT BIT(0)
> +#define TCA_TCPC_OFFSET 0x14
> +#define TCA_TCPC_MUX_CONTROL GENMASK(2, 0)
> +#define TCA_TCPC_MUX_CONTROL_USB_ONLY 0x1
> +#define TCA_TCPC_CONNECTOR_ORIENTATION BIT(3)
> +#define TCA_TCPC_VALID BIT(4)
> +#define TCA_CTRLSYNCMODE_CFG1_OFFSET 0x24
> +#define TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL GENMASK(19, 0)
> +#define TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS 0x1e85
> +#define TCA_PSTATE_0_OFFSET 0x50
> +#define TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS BIT(8)
> +
> +#define GPHY_TCA_DELAY_US 10
> +#define GPHY_TCA_TIMEOUT_US 110000
> +
>  enum google_usb_phy_id {
>         GOOGLE_USB2_PHY,
> +       GOOGLE_USB3_PHY,
>         GOOGLE_USB_PHY_NUM,
>  };
>
> @@ -46,53 +82,205 @@ struct google_usb_phy_instance {
>         struct reset_control_bulk_data *rsts;
>  };
>
> +struct google_usb_phy_config {
> +       const char * const *clk_names;
> +       unsigned int num_clks;
> +       const char * const *rst_names;
> +       unsigned int num_rsts;
> +};
> +
> +static const char * const u2phy_clk_names[] = {
> +       "usb2",
> +       "usb2_apb",
> +};
> +
> +static const char * const u3phy_clk_names[] = {
> +       "usb3"
> +};
> +
> +static const char * const u2phy_rst_names[] = {
> +       "usb2",
> +       "usb2_apb",
> +};
> +
> +static const char * const u3phy_rst_names[] = {
> +       "usb3"
> +};
> +
> +static const struct google_usb_phy_config phy_configs[GOOGLE_USB_PHY_NUM] = {
> +       [GOOGLE_USB2_PHY] = {
> +               .clk_names = u2phy_clk_names,
> +               .num_clks = ARRAY_SIZE(u2phy_clk_names),
> +               .rst_names = u2phy_rst_names,
> +               .num_rsts = ARRAY_SIZE(u2phy_rst_names),
> +       },
> +       [GOOGLE_USB3_PHY] = {
> +               .clk_names = u3phy_clk_names,
> +               .num_clks = ARRAY_SIZE(u3phy_clk_names),
> +               .rst_names = u3phy_rst_names,
> +               .num_rsts = ARRAY_SIZE(u3phy_rst_names),
> +       },
> +};
> +
> +static inline void google_usb_phy_clk_disable(struct google_usb_phy_instance *inst)
> +{
> +       clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> +}
> +
> +DEFINE_FREE(inst_clk_disable, struct google_usb_phy_instance *,
> +           if (_T) google_usb_phy_clk_disable(_T))
> +
> +static inline void google_usb_phy_rst_disable(struct google_usb_phy_instance *inst)
> +{
> +       reset_control_bulk_assert(inst->num_rsts, inst->rsts);
> +}
> +
> +DEFINE_FREE(inst_rst_disable, struct google_usb_phy_instance *,
> +           if (_T) google_usb_phy_rst_disable(_T))
> +
> +/*
> + * combo_phy_state
> + *     COMBO_PHY_IDLE: The ComboPHY has been torn down and USB3 has not completed
> + *                     bringup
> + *     COMBO_PHY_INIT_DONE: The ComboPHY bringup sequence is complete.
> + *     COMBO_PHY_TCA_READY: The PoR => NC transition is complete, and the TCA can be
> + *                          moved into USB.
> + */
> +enum combo_phy_state {
> +       COMBO_PHY_IDLE,
> +       COMBO_PHY_INIT_DONE,
> +       COMBO_PHY_TCA_READY,
> +};
> +
>  struct google_usb_phy {
>         struct device *dev;
>         struct regmap *usb_cfg_regmap;
>         unsigned int usb2_cfg_offset;
>         void __iomem *usbdp_top_base;
> +       void __iomem *usb3_tca_base;
>         struct google_usb_phy_instance *insts;
>         /*
>          * Protect phy registers from concurrent access, specifically via
> -        * google_usb_set_orientation callback.
> +        * google_usb_set_orientation callback. phy_mutex also protects
> +        * concurrent access to phy_state.
>          */
>         struct mutex phy_mutex;
>         struct typec_switch_dev *sw;
>         enum typec_orientation orientation;
> +       enum combo_phy_state phy_state;
>  };
>
>  static void set_vbus_valid(struct google_usb_phy *gphy)
>  {
>         u32 reg;
>
> -       if (gphy->orientation == TYPEC_ORIENTATION_NONE) {
> -               reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +       reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +       if (gphy->orientation == TYPEC_ORIENTATION_NONE)
>                 reg &= ~USBCS_PHY_CFG1_SYS_VBUSVALID;
> -               writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> -       } else {
> -               reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +       else
>                 reg |= USBCS_PHY_CFG1_SYS_VBUSVALID;
> -               writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> -       }
> +       writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +}
> +
> +static void set_sram_bypass(struct google_usb_phy *gphy, u32 bypass)
> +{
> +       u32 reg;
> +
> +       reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +       reg &= ~USBCS_PHY_CFG1_PHY0_SRAM_BYPASS_MODE;
> +       reg |= FIELD_PREP(USBCS_PHY_CFG1_PHY0_SRAM_BYPASS_MODE, bypass);
> +       writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +}
> +
> +static void set_pmgt_ref_clk_req_n(struct google_usb_phy *gphy, bool resume)
> +{
> +       u32 reg;
> +
> +       reg = readl(gphy->usbdp_top_base + USBDP_TOP_CFG_REG_OFFSET);
> +       if (resume)
> +               reg |= USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N;
> +       else
> +               reg &= ~USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N;
> +       writel(reg, gphy->usbdp_top_base + USBDP_TOP_CFG_REG_OFFSET);
> +}
> +
> +static inline void disable_pmgt_ref_clk_req_n(struct google_usb_phy *gphy)
> +{
> +       set_pmgt_ref_clk_req_n(gphy, false);
> +}
> +
> +DEFINE_FREE(pmgt_ref_clk_req_n, struct google_usb_phy *, if (_T) disable_pmgt_ref_clk_req_n(_T))
> +
> +static int wait_tca_xa_ack(struct google_usb_phy *gphy)
> +{
> +       int ret;
> +       u32 reg;
> +
> +       ret = readl_poll_timeout(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET,
> +                                reg, !!(reg & TCA_INTR_STS_XA_ACT_EVT),
> +                                GPHY_TCA_DELAY_US, GPHY_TCA_TIMEOUT_US);
> +       if (ret)
> +               dev_err(gphy->dev, "tca xa_ack timeout, ret=%d\n", ret);
> +
> +       return ret;
> +}
> +
> +static int program_tca_locked(struct google_usb_phy *gphy)
> +          __must_hold(&gphy->phy_mutex)
> +{
> +       int ret;
> +       u32 reg;
> +
> +       reg = readl(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
> +       writel(reg, gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
> +
> +       reg = readl(gphy->usb3_tca_base + TCA_TCPC_OFFSET);
> +       reg &= ~TCA_TCPC_MUX_CONTROL;
> +       reg |= FIELD_PREP(TCA_TCPC_MUX_CONTROL, TCA_TCPC_MUX_CONTROL_USB_ONLY);
> +       if (gphy->orientation == TYPEC_ORIENTATION_REVERSE)
> +               reg |= TCA_TCPC_CONNECTOR_ORIENTATION;
> +       else
> +               reg &= ~TCA_TCPC_CONNECTOR_ORIENTATION;
> +       reg |= TCA_TCPC_VALID;
> +       writel(reg, gphy->usb3_tca_base + TCA_TCPC_OFFSET);
> +
> +       ret = wait_tca_xa_ack(gphy);
> +       dev_dbg(gphy->dev, "TCA switch %s, mux %lu, orientation %s\n",
> +               ret ? "failed" : "success",
> +               FIELD_GET(TCA_TCPC_MUX_CONTROL, reg),
> +               FIELD_GET(TCA_TCPC_CONNECTOR_ORIENTATION, reg) ? "reverse" : "normal");
> +
> +       reg = readl(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
> +       writel(reg, gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
> +
> +       return ret;
>  }
>
>  static int google_usb_set_orientation(struct typec_switch_dev *sw,
>                                       enum typec_orientation orientation)
>  {
>         struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
> +       int ret = 0;
>
>         dev_dbg(gphy->dev, "set orientation %d\n", orientation);
>
> -       gphy->orientation = orientation;
> +       guard(mutex)(&gphy->phy_mutex);
>
> -       if (pm_runtime_suspended(gphy->dev))
> -               return 0;
> +       gphy->orientation = orientation;
>
> -       guard(mutex)(&gphy->phy_mutex);
> +       if (IS_ENABLED(CONFIG_PM)) {
> +               if (pm_runtime_get_if_active(gphy->dev) <= 0)
> +                       return 0;
> +       }
>
>         set_vbus_valid(gphy);
>
> -       return 0;
> +       if (gphy->phy_state == COMBO_PHY_TCA_READY && orientation != TYPEC_ORIENTATION_NONE)
> +               ret = program_tca_locked(gphy);
> +
> +       pm_runtime_put(gphy->dev);
> +
> +       return ret;
>  }
>
>  static int google_usb2_phy_init(struct phy *_phy)
> @@ -122,17 +310,18 @@ static int google_usb2_phy_init(struct phy *_phy)
>         ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
>         if (ret)
>                 return ret;
> +       struct google_usb_phy_instance *clk_dev __free(inst_clk_disable) = inst;
>
>         ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
> -       if (ret) {
> -               clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> +       if (ret)
>                 return ret;
> -       }
>
>         regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
>         reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
>         regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
>
> +       retain_and_null_ptr(clk_dev);
> +
>         return 0;
>  }
>
> @@ -161,6 +350,128 @@ static const struct phy_ops google_usb2_phy_ops = {
>         .exit           = google_usb2_phy_exit,
>  };
>
> +static int google_usb3_phy_init(struct phy *_phy)
> +{
> +       struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> +       struct google_usb_phy *gphy = inst->parent;
> +       int ret = 0;
> +       u32 reg;
> +
> +       dev_dbg(gphy->dev, "initializing usb3 phy\n");
> +
> +       guard(mutex)(&gphy->phy_mutex);
> +
> +       if (gphy->phy_state != COMBO_PHY_IDLE) {
> +               dev_warn(gphy->dev, "usb3 phy init called when combo phy state is not idle\n");
> +               return 0;
> +       }
> +
> +       reg = readl(gphy->usb3_tca_base + TCA_CTRLSYNCMODE_CFG1_OFFSET);
> +       reg &= ~TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL;
> +       reg |= FIELD_PREP(TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL,
> +                         TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS);
> +       writel(reg, gphy->usb3_tca_base + TCA_CTRLSYNCMODE_CFG1_OFFSET);
> +
> +       reg = readl(gphy->usbdp_top_base + PHY_POWER_CONFIG_REG1_OFFSET);
> +       reg |= PHY_POWER_CONFIG_REG1_PG_MODE_EN;
> +       reg &= ~PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG;
> +       reg |= FIELD_PREP(PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG,
> +                         (UPCS_PIPE_CONFIG_ISO_CPM |
> +                          UPCS_PIPE_CONFIG_PG_MODE_STATIC |
> +                          UPCS_PIPE_CONFIG_LANE_RESET_NO_PG_EXIT));
> +       writel(reg, gphy->usbdp_top_base + PHY_POWER_CONFIG_REG1_OFFSET);
> +
> +       set_vbus_valid(gphy);
> +
> +       reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +       reg |= USBCS_PHY_CFG1_PHY0_MPLLA_SSC_EN;
> +       writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +
> +       set_sram_bypass(gphy, SRAM_BYPASS_MODE_BYPASS_FIRMWARE |
> +                       SRAM_BYPASS_MODE_BYPASS_CONTEXT);
> +       set_pmgt_ref_clk_req_n(gphy, true);
> +       struct google_usb_phy *pmgt_ref_clk_req_dev __free(pmgt_ref_clk_req_n) = gphy;
> +
> +       ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
> +       if (ret)
> +               return ret;
> +       struct google_usb_phy_instance *clk_dev __free(inst_clk_disable) = inst;
> +
> +       ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
> +       if (ret)
> +               return ret;
> +       struct google_usb_phy_instance *rst_dev __free(inst_rst_disable) = inst;
> +
> +       ret = readl_poll_timeout(gphy->usb3_tca_base + TCA_PSTATE_0_OFFSET,
> +                                reg, !(reg & TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS),
> +                                GPHY_TCA_DELAY_US, GPHY_TCA_TIMEOUT_US);
> +       if (ret) {
> +               dev_err(gphy->dev, "wait for lane0 phystatus timed out\n");
> +               return ret;
> +       }
> +
> +       gphy->phy_state = COMBO_PHY_INIT_DONE;
> +
> +       retain_and_null_ptr(rst_dev);
> +       retain_and_null_ptr(clk_dev);
> +       retain_and_null_ptr(pmgt_ref_clk_req_dev);
> +
> +       return 0;
> +}
> +
> +static int google_usb3_phy_exit(struct phy *_phy)
> +{
> +       struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> +       struct google_usb_phy *gphy = inst->parent;
> +
> +       dev_dbg(gphy->dev, "exiting usb3 phy\n");
> +
> +       guard(mutex)(&gphy->phy_mutex);
> +
> +       reset_control_bulk_assert(inst->num_rsts, inst->rsts);
> +       clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> +       set_pmgt_ref_clk_req_n(gphy, false);
> +
> +       gphy->phy_state = COMBO_PHY_IDLE;
> +
> +       return 0;
> +}
> +
> +static int google_usb3_phy_power_on(struct phy *_phy)
> +{
> +       struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> +       struct google_usb_phy *gphy = inst->parent;
> +       int ret;
> +
> +       dev_dbg(gphy->dev, "power on usb3 phy\n");
> +
> +       guard(mutex)(&gphy->phy_mutex);
> +
> +       if (gphy->phy_state == COMBO_PHY_IDLE)
> +               return -EINVAL;
> +
> +       if (gphy->phy_state == COMBO_PHY_INIT_DONE) {
> +               /* Wait for PoR -> NC transitions*/
> +               ret = wait_tca_xa_ack(gphy);
> +               if (ret) {
> +                       dev_err(gphy->dev, "PoR->NC transition timeout\n");
> +                       return ret;
> +               }
> +               gphy->phy_state = COMBO_PHY_TCA_READY;
> +       }
> +
> +       if (gphy->orientation != TYPEC_ORIENTATION_NONE)
> +               return program_tca_locked(gphy);
> +
> +       return 0;
> +}
> +
> +static const struct phy_ops google_usb3_phy_ops = {
> +       .init           = google_usb3_phy_init,
> +       .exit           = google_usb3_phy_exit,
> +       .power_on       = google_usb3_phy_power_on,
> +};
> +
>  static struct phy *google_usb_phy_xlate(struct device *dev,
>                                         const struct of_phandle_args *args)
>  {
> @@ -173,14 +484,61 @@ static struct phy *google_usb_phy_xlate(struct device *dev,
>         return gphy->insts[args->args[0]].phy;
>  }
>
> +static int google_usb_phy_parse_clocks(struct google_usb_phy *gphy)
> +{
> +       struct device *dev = gphy->dev;
> +       int id, i, ret;
> +
> +       for (id = 0; id < GOOGLE_USB_PHY_NUM; id++) {
> +               const struct google_usb_phy_config *cfg = &phy_configs[id];
> +               struct google_usb_phy_instance *inst = &gphy->insts[id];
> +
> +               inst->num_clks = cfg->num_clks;
> +               inst->clks = devm_kcalloc(dev, inst->num_clks, sizeof(*inst->clks), GFP_KERNEL);
> +               if (!inst->clks)
> +                       return -ENOMEM;
> +
> +               for (i = 0; i < inst->num_clks; i++)
> +                       inst->clks[i].id = cfg->clk_names[i];
> +
> +               ret = devm_clk_bulk_get(dev, inst->num_clks, inst->clks);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "failed to get phy%d clks\n", id);
> +       }
> +
> +       return 0;
> +}
> +
> +static int google_usb_phy_parse_resets(struct google_usb_phy *gphy)
> +{
> +       struct device *dev = gphy->dev;
> +       int id, i, ret;
> +
> +       for (id = 0; id < GOOGLE_USB_PHY_NUM; id++) {
> +               const struct google_usb_phy_config *cfg = &phy_configs[id];
> +               struct google_usb_phy_instance *inst = &gphy->insts[id];
> +
> +               inst->num_rsts = cfg->num_rsts;
> +               inst->rsts = devm_kcalloc(dev, inst->num_rsts, sizeof(*inst->rsts), GFP_KERNEL);
> +               if (!inst->rsts)
> +                       return -ENOMEM;
> +
> +               for (i = 0; i < inst->num_rsts; i++)
> +                       inst->rsts[i].id = cfg->rst_names[i];
> +               ret = devm_reset_control_bulk_get_exclusive(dev, inst->num_rsts, inst->rsts);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "failed to get phy%d resets\n", id);
> +       }
> +
> +       return 0;
> +}
> +
>  static int google_usb_phy_probe(struct platform_device *pdev)
>  {
>         struct typec_switch_desc sw_desc = { };
> -       struct google_usb_phy_instance *inst;
>         struct phy_provider *phy_provider;
>         struct device *dev = &pdev->dev;
>         struct google_usb_phy *gphy;
> -       struct phy *phy;
>         u32 args[1];
>         int ret;
>
> @@ -212,46 +570,48 @@ static int google_usb_phy_probe(struct platform_device *pdev)
>                 return dev_err_probe(dev, PTR_ERR(gphy->usbdp_top_base),
>                                     "invalid usbdp top\n");
>
> +       gphy->usb3_tca_base = devm_platform_ioremap_resource_byname(pdev,
> +                                                                   "usb3_tca");
> +       if (IS_ERR(gphy->usb3_tca_base))
> +               return dev_err_probe(dev, PTR_ERR(gphy->usb3_tca_base),
> +                                   "invalid usb3 tca\n");
> +
>         gphy->insts = devm_kcalloc(dev, GOOGLE_USB_PHY_NUM, sizeof(*gphy->insts), GFP_KERNEL);
>         if (!gphy->insts)
>                 return -ENOMEM;
>
> -       inst = &gphy->insts[GOOGLE_USB2_PHY];
> -       inst->parent = gphy;
> -       inst->index = GOOGLE_USB2_PHY;
> -       phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
> -       if (IS_ERR(phy))
> -               return dev_err_probe(dev, PTR_ERR(phy),
> +       gphy->insts[GOOGLE_USB2_PHY].phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
> +       gphy->insts[GOOGLE_USB2_PHY].index = GOOGLE_USB2_PHY;
> +       gphy->insts[GOOGLE_USB2_PHY].parent = gphy;
> +       if (IS_ERR(gphy->insts[GOOGLE_USB2_PHY].phy))
> +               return dev_err_probe(dev, PTR_ERR(gphy->insts[GOOGLE_USB2_PHY].phy),
>                                      "failed to create usb2 phy instance\n");
> -       inst->phy = phy;
> -       phy_set_drvdata(phy, inst);
> +       phy_set_drvdata(gphy->insts[GOOGLE_USB2_PHY].phy, &gphy->insts[GOOGLE_USB2_PHY]);
>
> -       inst->num_clks = 2;
> -       inst->clks = devm_kcalloc(dev, inst->num_clks, sizeof(*inst->clks), GFP_KERNEL);
> -       if (!inst->clks)
> -               return -ENOMEM;
> -       inst->clks[0].id = "usb2";
> -       inst->clks[1].id = "usb2_apb";
> -       ret = devm_clk_bulk_get(dev, inst->num_clks, inst->clks);
> +       gphy->insts[GOOGLE_USB3_PHY].phy = devm_phy_create(dev, NULL, &google_usb3_phy_ops);
> +       gphy->insts[GOOGLE_USB3_PHY].index = GOOGLE_USB3_PHY;
> +       gphy->insts[GOOGLE_USB3_PHY].parent = gphy;
> +       if (IS_ERR(gphy->insts[GOOGLE_USB3_PHY].phy))
> +               return dev_err_probe(dev, PTR_ERR(gphy->insts[GOOGLE_USB3_PHY].phy),
> +                                    "failed to create usb3 phy instance\n");
> +       phy_set_drvdata(gphy->insts[GOOGLE_USB3_PHY].phy, &gphy->insts[GOOGLE_USB3_PHY]);
> +
> +       ret = google_usb_phy_parse_clocks(gphy);
>         if (ret)
> -               return dev_err_probe(dev, ret, "failed to get u2 phy clks\n");
> +               return ret;
>
> -       inst->num_rsts = 2;
> -       inst->rsts = devm_kcalloc(dev, inst->num_rsts, sizeof(*inst->rsts), GFP_KERNEL);
> -       if (!inst->rsts)
> -               return -ENOMEM;
> -       inst->rsts[0].id = "usb2";
> -       inst->rsts[1].id = "usb2_apb";
> -       ret = devm_reset_control_bulk_get_exclusive(dev, inst->num_rsts, inst->rsts);
> +       ret = google_usb_phy_parse_resets(gphy);
>         if (ret)
> -               return dev_err_probe(dev, ret, "failed to get u2 phy resets\n");
> +               return ret;
>
>         phy_provider = devm_of_phy_provider_register(dev, google_usb_phy_xlate);
>         if (IS_ERR(phy_provider))
>                 return dev_err_probe(dev, PTR_ERR(phy_provider),
>                                      "failed to register phy provider\n");
>
> -       pm_runtime_enable(dev);
> +       ret = devm_pm_runtime_enable(dev);
> +       if (ret)
> +               return ret;
>
>         sw_desc.fwnode = dev_fwnode(dev);
>         sw_desc.drvdata = gphy;
> @@ -271,7 +631,6 @@ static void google_usb_phy_remove(struct platform_device *pdev)
>         struct google_usb_phy *gphy = dev_get_drvdata(&pdev->dev);
>
>         typec_switch_unregister(gphy->sw);
> -       pm_runtime_disable(&pdev->dev);
>  }
>
>  static const struct of_device_id google_usb_phy_of_match[] = {
>
> base-commit: c7f2322431cb6d108b18fb4154606b49e2bc50f7
> --
> 2.56.0.rc1.315.gc6ed9934b7-goog
>

Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011AE38945A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790365243; cv=pass; b=dJmc7QDxbWdrfbvJSlhNF6fP+lO6CrdMBbPcom7Tq9WW7NLYsM+L/Z2fv0oMfd3kOkNfZh1E/MT707BpygJlDecP+653+MRgbBeWh6VgP/ENZ47kk0eICCZzTr4kFnvDw6DtSc3hyCO/dIWjc1wgIlcmJHJ9lXodk4jhGQcgSrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790365243; c=relaxed/simple;
	bh=OiihpvIIlzoVJu2DCK6dCNo1iVpixAYRYF6mCtC37lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kk3Lb/Jrqqbvj+e4mMB1xkWTD+60gOeBTWfU5+o8pcG2ymVfulXJDPBtMnPNktVUSnVyC+97T09lVXiyzsEsOdAdPAJrEl4qx1tn4CLnhmOZyc/8mUdYFzBsLlxs1x4aArB2jHlzDYe8ywXx3DqbaKgjF22/pNP370rKZI5m8aE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QKxq5/VI; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QKxq5/VI"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-801a8bf8112so485110a34.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2026 12:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790365241; cv=none;
        d=google.com; s=arc-20260327;
        b=DfcZX/vkXOGugXBAWAc3GpBuSQhATOKCfVhxs9UW33wCFk1ALxWhmQXUt1CcrBOSvG
         zL+Sosap/wYRErHaVdSMca+3MUXrFS4xw12ER1vgmfhxArrT8uejJL160rV8988+Zfoa
         H6x/9GNM4DwBhbBtIfcEoeR1XX7JSdNX3PcG2pshv4x0DmjWIic/IqOLqX3X04kEbB4g
         11UXcwFl7sGfNJ2/T5nrwM+dnR2cT+Mcz6EML8PvyVJmafOqxxqV5PR+qfeMQBXo8u2B
         EnY8HFqhMIFNUzoc9oLJJax2E0eIU2hgB0yvlL0JI9irv6l+wa0AligoBnCZC/vk7MIP
         IHHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QRtQwrI36+tl+6Prwhx/Tagi3Pi4qOHQ7OtnSC5ifgE=;
        fh=Y0CqHnyUs2C4oo2+IxVRSXWvvRwdJwotGHmvl7CZG7I=;
        b=iF7CxQGXSmGhIUdaEH1apj+pn0rj9ahVOk95sknDILcCqkg6NarVBXVoyTTy81AkEa
         3sydACyVYnm5bTNIv0e2ca0x4CFMkANmx96JwicItEZ9ysu/SZfHkYgHiCfWvTpU9B44
         vX/N66KGQ9lBpLNS0ltNYuxsffLvM235U14L6vglls1/HsalFkgKA1i/+hnYmf+rPYss
         z+qq09Tq5UVjd1JaACam37QtF8U03uI7xYjG4voOvseUHQxWrYiKJZvrG93Dwt9DadD3
         g6EQimTCI906zj6DC3s5tCk8D0M58S/DCg4ZZTysJ2d55JbnSP/NJFisKithSeXveLNn
         zV4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790365241; x=1790970041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QRtQwrI36+tl+6Prwhx/Tagi3Pi4qOHQ7OtnSC5ifgE=;
        b=QKxq5/VIOaGIN3ETW2kO5BE585sPd3T+R5MlPhz1HBBqMb7Q0DuVytci+Yx0K8nW8Y
         0eYnOUkUZrm9g2Nyg2yxQodVBsk5j4bjuCov1Z2mQZfAQLOkhdeNo7V7mim/K72ReJud
         iIJ2d5WM0CqwqrurBwWtbGuBuFSJ/RidfX3DF9Ka9eO1vfzJ/RFqMe4EYcMpLUkUkT7Y
         xSH2TlXtExBIwumqocbBTPbAaXcBIpAs/F37rzVGRFltgaUDu20YE5x7F6VjnCRs4GDh
         I3NGZJQATYo1KnB+aV7j6vetPysdhhgXqbXZNFUbeQvrRK9mRN94T1VhRoTscaZFOAmM
         ErgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790365241; x=1790970041;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRtQwrI36+tl+6Prwhx/Tagi3Pi4qOHQ7OtnSC5ifgE=;
        b=JUqGklJzXYV4pUfXZi7o7pclKLZoaMVcU2TkFrPMvS6NeqoStMONk41dACLMSAe+p/
         fWW3TVXDNJ8ROzQ/aBat26uVRO/2vyTXL+Vy6XGvgX+xlXmOWe1BWvpmXADYGduyQW0V
         4KsgvmVhr/l1feXbwmvPVeEfT9OMoTSlhbyoPid8VImwYpWCaHr1eJ+0uknZHfx+9Ar6
         agKcY4pPZPIKd43RF3Q3zQInQRbZa8S/8LKSgEFW++I/yoZF8CjBCOrKXe0XMY91l6CV
         IQFCH6xjMGSnL2gKBCHX+BbzARwWg4HoBKAT/EIP2bB94lQyuKm20CU0nVA9WWn0ojQE
         OvKA==
X-Forwarded-Encrypted: i=1; AKwUvBymRmQsRjD2GR1FIFlGkZR0ZP2zydmUZiBCBBc8keI4+YQO0ZaQmOLuNxI2WBiheQCkIHOmH9r7HGlUwKwIXmx5eQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lQHcTvJprKampCJbmKMOlRC2EJylMlG9CCnuAP32bethEJsZcR
	Cb3c2zNiry7ulc7287zeYk+nZq2zzgI4wyboT8a+SI3t6Fh/6BPJIxf3h9EBRYpnbf8Lj7E2kVH
	+TpIM6qsi7TE4aW0wfgUwpQV+iOCZjL80gVBDeJXycfY/TLeyy0qEoDtLEtU=
X-Gm-Gg: AYBFou1Yp7+SXBoAXA1PuhAkwtRd0T2pkBiAboLa2QbSMn5zj9DG+P1oEmWuXlYQzK/
	W5P+O0lZIoWU2cIZg6gTv592d5g/O2HxBuZXILlBiSA4jEH6Qsi+b/pS+GEGfgSTrvFbOu74gTC
	YZyBk+hO/04yD1zYLMlD4maDKTF/rFxvvO8gyCEJKF+RQUc8uL7QT4SLY41fWtEK3+gHcdhI04P
	F1MHZ8WG0Zk+wtrphz1HJJYRI/IFE1+Oho4vNXCMsSd+gejT4smVXhwpkNPWBmXzT7cw8EFw40p
	xBQTI75jBDLY5iPY1WEoEpkIfl1T0LWTPxud1atniRxZ38KzeC7EAZ4dX1tmOF53dP8AEOewyVy
	uOpoOnI41TjOs
X-Received: by 2002:a05:6808:30aa:b0:4d6:90f3:74ae with SMTP id
 5614622812f47-4dc6606bcc9mr4067609b6e.46.1790365240133; Fri, 25 Sep 2026
 12:40:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918222513.2633456-2-rdbabiera@google.com> <arF3fynAGG5khe3B@google.com>
In-Reply-To: <arF3fynAGG5khe3B@google.com>
From: RD Babiera <rdbabiera@google.com>
Date: Fri, 25 Sep 2026 12:40:29 -0700
X-Gm-Features: AclHuK_91DQZxLqN7uLYqBpJX2aYJ1LY4FTA5TNLS7LM4bAkU5HscFKOZ-tm8pA
Message-ID: <CALzBnUEw4J1SB8a7is5Q-OKhkuQuPWUJcu9KHRrZO37k==FEOQ@mail.gmail.com>
Subject: Re: [PATCH v7] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
To: Neill Kapron <nkapron@google.com>
Cc: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de, neil.armstrong@linaro.org, 
	badhri@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neill, thanks for the thorough review. Will send v8 out shortly.

On Mon, Sep 21, 2026 at 11:29=E2=80=AFAM Neill Kapron <nkapron@google.com> =
wrote:
> The driver is now using readl_poll_timeout() and
> pm_runtime_get_if_active(), we should be including linux/iopoll.h and
> linux/pm_runtime.h explicitly.

Acknowledged.

> > +#define TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS 0x1e85
> > +#define TCA_PSTATE_0_OFFSET 0x50
> > +#define TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS BIT(8)
> > +
> > +#define GPHY_TCA_DELAY_US 10
> > +#define GPHY_TCA_TIMEOUT_US 100000
>
> With the addition of TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS, we
> should consider bumping GPHY_TCA_TIMEOUT_US to be slightly larger (e.g.
> 110000us) to ensure the hardware timeout is guaranteed to expire before
> the software poll timeout.

Will change here.

> > +static const char * const u2phy_clk_names[] =3D {
> > +     "usb2",
> > +     "usb2_apb",
> > +};
> > +static const char * const u3phy_clk_names[] =3D {
> > +     "usb3"
> > +};
> > +static const char * const u2phy_rst_names[] =3D {
> > +     "usb2",
> > +     "usb2_apb",
> > +};
> > +static const char * const u3phy_rst_names[] =3D {
> > +     "usb3"
> > +};
>
> nit: checkpatch.pl --strict flags missing blank lines between these
> array declarations (and the inline helper functions + DEFINE__FREE
> macros below).

Will check.

> >  static int google_usb_set_orientation(struct typec_switch_dev *sw,
> >                                     enum typec_orientation orientation)
> >  {
> >       struct google_usb_phy *gphy =3D typec_switch_get_drvdata(sw);
> > +     int ret =3D 0;
> >
> >       dev_dbg(gphy->dev, "set orientation %d\n", orientation);
> >
> > -     gphy->orientation =3D orientation;
> > +     guard(mutex)(&gphy->phy_mutex);
> >
> > -     if (pm_runtime_suspended(gphy->dev))
> > -             return 0;
> > +     gphy->orientation =3D orientation;
> >
> > -     guard(mutex)(&gphy->phy_mutex);
> > +     if (IS_ENABLED(CONFIG_PM)) {
> > +             if (pm_runtime_get_if_active(gphy->dev) <=3D 0)
> > +                     return 0;
> > +     }
> >
> >       set_vbus_valid(gphy);
> >
> > -     return 0;
> > +     if (gphy->phy_state =3D=3D COMBO_PHY_TCA_READY && orientation !=
=3D TYPEC_ORIENTATION_NONE)
> > +             ret =3D program_tca_locked(gphy);
> > +
> > +     pm_runtime_put(gphy->dev);
> > +
> > +     return ret;
> >  }
>
> Previously, sashiko recommended moving to pm_runtime_get_if_active(),
> which was done in v6. However I think this may have changed the behavior
> of google_usb_set_orientation() and potentially introduced a regression
> due to the pre-existing ordering of calls in gooogle_usb_phy_probe(),
> causing this function to always take the early 'return 0' path.
>
> In google_usb_phy_probe(), we call devm_phy_create() prior to calling
> pm_runtime_enable(dev).
>
> In drivers/phy/phy-core.c, devm_phy_create() calls phy_create(), which
> has the following check:
>
>     if (pm_runtime_enabled(dev)) {
>         pm_runtime_enable(&phy->dev);
>         pm_runtime_no_callbacks(&phy->dev);
>     }
>
> Therefore, the phy device never has pm_runtime_enabled, causing this
> call to pm_runtime_get_if_active() to always return 0, and the function
> exits prior to calling `set_vbus_valid()`.
>
> I think moving the pm_runtime_enable(dev) call prior to
> devm_phy_create() will resolve the issue, but we should audit power
> managment in this driver to verify.

The check here is called on gphy->dev as opposed to phy->dev. fw_devlink us=
es
FW_DEVLINK_FLAGS_RPM by default, so the dwc3 consumer controller holds
DL_FLAG_PM_RUNTIME on the phy platform device. Every resume call on
the dwc3 controller results in the supplier resuming as well under this
model, so the runtime_get() call here passes.

> I think this introduces a regression between v6 and v7, as usb3_tca_base
> may be accessed prior to the 'usb3' clock being enabled, and
> furthermore, the call to reset_control_bulk_deassert() will clear this
> value.
>
> Therefore, I think we need to this after the call to
> reset_control_bulk_deassert().

usb3_tca_base is powered by a different clock as opposed to the 'usb3'
one, so the register access will be safe as long as the platform driver's
power domain is on. Register reads in either order both result in the
same behavior during testing, but I would argue that writing before
the call to reset_control_bulk_deassert() ensures that the parameter
is applied on PoR.

Best,
RD

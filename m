Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70FD2F83CB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 21:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768857869; cv=pass; b=LgvaoacH+mh9RlW3Na+qjldfs0TipxI9aL1SR/3vMarw3sNfvAaQM+KlzIF1lOuOKOPgfRZd1deGvsb0suGCU/qZsGymaz1ZeALcgsCKjsNR8UQ+/tt9nckzHrJeKTrF/5vi3zhC5lT4rsahfEP8zAuVzTDZfmAkLIusO+3iDv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768857869; c=relaxed/simple;
	bh=P564zifxGq7gpIAXiYMGNHPdZBZ6qjwcGkLD/d5fbQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Js2E4THjBN9iwRyrdxpf6xSM/mTgOMjAlTraC3puBLHQRcPonehBkbNplfn7oc9HVyHSV1Dfg32VVEdB9ICqrS3SFEfwgfZmVE4OKbcWxpzwgBi4NzZe1XuxF+uc8KmD+Hd6U+qd1NxDCF4ADBwVJR4EfBeCGtI2CNhbvwXd+ZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=e8U1dkI6; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="e8U1dkI6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0c09bb78cso35897475ad.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 13:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768857867; cv=none;
        d=google.com; s=arc-20240605;
        b=RV2EhtkSp/iGabV5vqRwFjT6cXbajutSZCdcS+Te6WzX9t10e/8TgwhrS25gMCszfT
         RYWcIfVPJOjny2dPdPQir5X0rt5hekuCuJbV1QrHaN3q5rxZKhTk+2AjoZMYLGQAnXQr
         gXA7pkIfPNS1kH5pQhpIOrBR63Y+at7K4wKv7pFF7DhOTgzoAG8wsmxjGKO0nKGr5FNy
         KWmdkEwPSmmsgvDZfSwpZ25ZepsdoJirW4ODiLtBnyeCZBMOukdG5T5c+sN1QFO3a5uA
         RZQHoLWsYdOxg4IkO9EOqGzd0EDsZDns2FyHpmkwN+Prax8ND0J0vzMr9pe4NkYz2f8B
         dPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        fh=oufAVdDAvcDbVoqRS7cM8SJ4kwRfM7qGzBBEq0Oplfw=;
        b=lMyZzmxfeOiFXHIBFYBM2d74DH1VIydPx8itmVoucAIbPbZUw2znEZn+vuaP9fB/jv
         KRtBDrtG5dBZ19IsnFxoav9C1iUqa4lYm1J6fD+niHwn8ke2BqqWd/Fj57G9f2jJSY+U
         8KXBkbZmfSRDSuxV8zqp+3BN0+pZgTiRXZV9j2eE+ua8y2TTJVclZFXy+ugEIeVk2C9m
         M9uzM+LCXil4kTxpYb7ATLZS05XapftZwmauzgH4iOidONc5d/oDQ4o/Z8UdTYEwVD9O
         clA2ZyPkhuwCSUdjSc9wm5Qa3uXFxrtLrTaLPh8ybB5j0C8Ocn9eCexI8QQSKDmfzrip
         iXww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768857867; x=1769462667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        b=e8U1dkI6DB5g9Ud3jh7ZrVTy4kw65DnWzVP6Eg4qIVVcEXKISsqB52ybMQZcBeUMaD
         LZcu9F7ziqGrw0ASdoTyshMRjZNopbTbORYTCZVfbedPCpv1wtO1FEGdp89jxauvib4q
         3NJsuTh1Exd1N5WmpEmSYzjFR7ibNu/WySddB74fntO4v7GMBCOcu6NaNKlpzglTgCJM
         Hja+JOnzt0nxeenK6VADbOvv+eUdJ+EAkJ9LMUsUyoVzHp9dPVcXTC+8kCBwWtZdZWvb
         SByNFCkjyctX8XolJEzbXChwNJkHp5Z4lGYvpqnsbuiU6ewHLSdneSLreUERv8RBlC9Z
         tbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768857867; x=1769462667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        b=IZgztv6kV5YIhSs0dK2zYmQb583zP4nTlHQGAJwQPjcofKO2Wl2sNeMUuQJywMhSzT
         swTZNTefnmItjBd02w+428j/Ro4BsFo2ZOfjOsEDT9Nd5Xl9uyHd5reWdKybWmhJChqW
         CUCG86STXEIQnZRw4X98BXiT/D4lSK6cLzyVMdY9TFm/2q94yDw9IQdNp6mmcGV7/pBk
         oLXbnsqs+3ow5p6pDVDTOSoWUSbCYyjYJ44PIvYYnuAhFFe4EXiGd1cbAkv3ocsJUD17
         6fPUefDoynvdr02xpD5LkHITs3ZP2IivMrlE59Pn5Zr0rL14nQdo8JTJ7nbmQc0d9SAU
         8Esg==
X-Forwarded-Encrypted: i=1; AJvYcCWVi6hDl0xoLdTkY31gOky3KWvQv0u6I5giXJy33GVzzSP6UN4x5VeXL1opaKxzj2OY36dGdZ/llDs+VBF2UVpelw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAID3QVJ/DiTL++0Ek523fgKdFh4KCM4+0dVVPSp7+waFpNa9x
	M+v6M4a+rtNbUWmcKgOqOBK90nyLg6ZNpm6dGL5XyR8FYUHu9mOahUiKbcJ3n+KUKWYzdZuleZp
	+IN8ouLsu/L34z0P5TC+/Al5pgN/t5+g=
X-Gm-Gg: AZuq6aIT9xevAasJa9JdzjbCXhJLpz2X6tYm1N3Ipk+ekRf/3SMmEROA4sBynyeiZp4
	Te0TjZMFidwrYWLgGti66rb6AgcMQePop8ldg9OUHKxVkL3PLo+kh7uchZM9DE1UDlNMNWczouw
	AAcEGvWLR5ksx+Qg2wLfxThQw17Sb57csr2+FWYb6IhhX2DRHhMwnwvcolgg4rjZlCIfkaY5fkH
	V0X1W1aIlilSPuXSKkIwjfDf1SSfV7wDVKy/tj5mRIXREQWzR6u2WSpL9lyXenuhpnPFcZ/9hhj
	3fLMVUMXqz8KU9F2qSZ+GKzAtWXAPzLquI50D1Q=
X-Received: by 2002:a17:902:e787:b0:2a0:fb1c:144e with SMTP id
 d9443c01a7336-2a700990c98mr136201155ad.7.1768857866821; Mon, 19 Jan 2026
 13:24:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
 <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com> <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
In-Reply-To: <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jan 2026 22:24:15 +0100
X-Gm-Features: AZwV_QgxI3L9klOeJM7lsCljCRIK_bf05uJfhQMd5VWt4KtGJ4pArfXR_EjKQn4
Message-ID: <CAFBinCCz+MobtXYdiyWRBBFBDo77iULLOZ1p2i4fAVnpJ1NzJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Tue, Jan 13, 2026 at 6:31=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
[...]
> >> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *d=
ev, struct device *master,
> >>                                    void *data)
> >>  {
> >>         struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
> >> +       struct platform_device *pdev =3D to_platform_device(dev);
> >> +       int irq =3D platform_get_irq(pdev, 0);
> >>
> >> +       devm_free_irq(dev, irq, meson_dw_hdmi);
> > I have one question (so I can understand things better):
> > is there a particular reason why you went with free'ing the IRQ
> > instead of "just" masking it (so the hardware won't fire anymore of
> > those IRQs)?
>
> One reason is symmetry: _bind requests the irq, so _unbind does the
> reverse.
>
> Another is I don't have the hardware, so I wanted my changes to be as sma=
ll
> and clear as possible.
Understood, thanks!

> In principle one could request/free the irq in probe/remove and then
> enable/disable it in bind/unbind. Whether it would be a good or bad idea =
I
> don't know, but surely it would be more complex and I wouldn't want to do
> it without any chance to test it on hardware.
>
> Also, that would only optimize the case of multiple bind/unbind cycles,
> which are not quite realistic without bridge hotplug. And brigde hotplug
> does not exist yet in mainline, and when it will arrive it will be used
> only for a few use cases.
>
> I hope this answers your question.
Yes, I was curious whether you considered devm_free_irq() as the only
"correct" approach (in this case I would have recommended a comment)
or whether other approaches are fine too.
This is useful knowledge for me in case we ever need to restructure the dri=
ver.


Best regards,
Martin

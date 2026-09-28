Received: from mail-ua2-f37.google.com (mail-ua2-f37.google.com [74.125.226.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6C4502555
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 22:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.229
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632866; cv=pass; b=Pb2LVIPXWCKsU2YElByR0goFqGFgX+0S6JBFHPOb3YZDkSA/zakLgAdrnzaRB4uujsJV893lnn9PZRzVXfup45l9xLEIZiTNvI3xli9/CNEL7jvucwovxoN3Qzg7W6PIaO7y1y9W5V1QMjBZNYm1+GYKfmsOgMreLqNcpWHZVb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632866; c=relaxed/simple;
	bh=TGsgu118fb0aWZcIW4jWQUOTUObcVcSpLFpjYKBcXDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=st0M7/dTGuXG0t/yefau6mvZnz3oOsUAHD2cNZ4lakqkxw5AwtGm6rTpAYxXwNhMGNTBrojytiC9a13EC3YvhGdf+pAjzthCZlDZMaB68GT0CwQbmjZ+oeIDrNM0L8mAQFC951/8V/B0OYUFQ1pq4khUwFYg51ii4Wy86d+Nyf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZJ6iIMM/; arc=pass smtp.client-ip=74.125.226.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZJ6iIMM/"
Received: by mail-ua2-f37.google.com with SMTP id a1e0cc1a2514c-986df7ac62dso1807796241.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 15:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790632863; cv=none;
        d=google.com; s=arc-20260327;
        b=nIBYg7KdpZ7vI0XaETqAtYkNDP2JA3KAV64Bh48Tq505jKqjwpk++KwGIoAekOTt/O
         zfQ3bnxgPkUF1iwjTDtvZaA3A3psYAJTnL2uQNp6mqlK6E95eyrtYzVSl0+4kOuVxcnz
         XJhEGZjX5hGtLCxMpJa3/gVnXV0Gjim5QTABYa8cPNRiN3IJF/5reQveOEXHWPkOpsia
         JV8BQ3IbOppM2N1LJMa6ZnOGj/MfhaxkEmC2BWxO8ZK8DuzreBAecQJR9y5ZQ51aLTE2
         bfJKk4WmPnWRYt7RRAOWxiaHif7rOHwlDlyM5JuDBL3E2xdDGudu1jrdIrWbPBT8jeLo
         ZClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IIbizLL1IW50D5D/SYfMtdqVqG9t1BZagIkpl9KdDG8=;
        fh=o1bFjWFHLNgCM4P/NMQ6vP4rxXX4EXfA/88sSikJ1qw=;
        b=S2SSbfq2Mk3yW5qYk39ouo1JJvElGd9S9dFeOzPQiQgCbVrtaK+zJWMbBxPY/deTQQ
         wWF1poXX15+4KuEzGW92nwFx9EOXZDTeTAeKmu40kNK61udkaXolP9nu1fOLnWOIixmk
         PxMvFuw90Hy7xWV+lkLNf1NPtEbNIaQZ/MOByIti24w3aQyUz11T0X/rvhnTjeaGIONd
         KZPEQf6kANWJPG/4Dp4u7j0pAqg5SZ1T6sai8Bnrk1vD+SBVEimZHs0WSW/hKqP8TiR6
         bY45bxFfvHBeCi3zuRwLzwzJg0o84/yM0fZRivmKyIZ8MAE5bcPOHxVh2QM1htzsdCsi
         /GWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790632863; x=1791237663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IIbizLL1IW50D5D/SYfMtdqVqG9t1BZagIkpl9KdDG8=;
        b=ZJ6iIMM/hIEkTW+jQXaiBAdfmf1Zying4RIvihgdh5hr2Q6zlD+qxOIplVPnBDZfxH
         Gwf/zu8qDA5Y0uOmhG37i5vBKGszqw+OiE/7YvWaaenVrqTScnT75f6I98A3qHUFo+Fz
         BtFYRv33Wtf+/FX07Q518WpipQuzqrtaRIubF0cKx4B+T3yYc3llJxfiINaMSNrJUM6z
         sr8iVuQlqvBVpPPrhkbicVbCjvEWlcgwxjgy3GOx3HAppsaV7ZP7m2tj/n1MzBm3wOMr
         xkLyMb09uMUpmFTDqeer2xaVEdQRLUvhfCbrbYb/c2LBgE/xpk9DGVYsrKVvRq53Kmfr
         Ksqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790632863; x=1791237663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIbizLL1IW50D5D/SYfMtdqVqG9t1BZagIkpl9KdDG8=;
        b=o+1Yl1SjL+DnkbQ4pGMbClPD2yrQjG8rfnM0P8N9OoBjTmKiLwil9QkvkdUYsbueWR
         oAOGziBucODb/G0LkC4QFB8SC1f50wO1O6uQ+1N01UhOvILuwanw5Cj1BQ/pbtqgBPLd
         u5k9hyNP9QAH+MrQ7aFBsQN+qmIeT0MxBUvVCsUCxvOjzaVd9JsuN0LLbCPsdSXpgDG1
         qYIjQn9ytIGVHCnZGSS2J6mzYyDoL0uhnHZQDZ8jizTHHOm+8uV9V+mpU5LHJEJpzh+E
         FMLt8/kNlnZme8SjYNpioNM7yoyQgYA2gxdONPz1gvz3InFPQvjrjFwCvNGJPIeujyoi
         u1ww==
X-Forwarded-Encrypted: i=1; AKwUvBwGaz/yaG7DxIISJ18ZEh9F4AvIft7W2rb+rr1K3lpDZXaYAjqOPwKcEguehNf/O5RnxgdufaZWj9E+JItXUBuSGg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvHLvdFnbd7fkLB0g1QBtHymWhZTzFmiFQ3miQSCe3A04XJTgZ
	G6tn0OYFIp0hHiO/4WpKnrWYQkqVYSdY5b8vgt8Lrwex4RXC5ZhcmJxChU1dZCrpgTDawpAdrhm
	k38mKWd6qHWxwPrHYSFsbaayrCAzfrOFPNvYLCrw=
X-Gm-Gg: AYBFou399RXth1bOKTEDt/uPRY498pkdqb6i1FZiMPttnxDIgkFxGq65WNC/5yjZvka
	Yuwg9gLqhVYQCfXZDhBOPWgP9tzjvXtCTXXmWzJspyi8+bU5qHQNkbveq0oIFULzrDpeQrNatdE
	v5BE/Yi7io7A1hnqW8ffg6o5yPWBSdYJOWJQRZ4AVJ7rfYjoeDBhshGroOX2qk8wtdlw0XtvBEu
	nc2ua42knDkKClCnfyCpRhb1F/AaK3+6fFixDUk6VnZnop9IaxxRbPSx6Tkp6zKLyQA/ZTXi3rz
	nccy9xCGRUuQ7bThR2T0Mke2MkwuzepWLg7TRD+X6/zQqdByQUFo3jzPNHjXRs+9+E+omQJKFfk
	x4th6CLUjlB5VqsKqNHrOzcHoHkCRWrs=
X-Received: by 2002:a05:6102:f9b:b0:7a5:2792:32d0 with SMTP id
 ada2fe7eead31-7af1ceaa02emr5908124137.15.1790632862303; Mon, 28 Sep 2026
 15:01:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927190758.609156-1-nikitash.mariiaw@gmail.com> <arrfZ5CYyLt0vwu5@google.com>
In-Reply-To: <arrfZ5CYyLt0vwu5@google.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Sep 2026 15:00:45 -0700
X-Gm-Features: AclHuK94P4MPekguKF_IY4W_INzWG9JHQ-jlAiJvXzpu9Cjfe5tqxJdexiBcwT8
Message-ID: <CAGG=3QVY_OGjSYZgJ8i8Nb-EbwHKPOvZsbqqXfcbv+Vvq_wsww@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Use snprintf() to construct pin bank names
To: Justin Stitt <justinstitt@google.com>
Cc: Mariia Nikitash <nikitash.mariiaw@gmail.com>, krzk@kernel.org, s.nawrocki@samsung.com, 
	peter.griffin@linaro.org, linusw@kernel.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, 
	aleksandr.loktionov@intel.com, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:43=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> Hi,
>
> On Sun, Sep 27, 2026 at 12:07:58PM -0700, Mariia Nikitash wrote:
> > From: Bill Wendling <morbo@google.com>
> >
> > samsung_banks_node_get() constructs each pin bank node name by copying
> > bank->name with strscpy() and appending the suffix with strlcat().
> >
> > In preparation for removing the deprecated strlcat() API[1], format the
> > node name in a single snprintf() call, which preserves the existing
> > truncation check against sizeof(node_name).
> >
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Cc: codemender-patching+linux@google.com
> > Assisted-by: LLM
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
> > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
>
> Are you forwarding this patch on behalf of Bill? I see Bill as the
> author of the commit and I recall seeing this in some series he sent
> earlier [1] and this patch you've sent doesn't seem to be a v2.
>
> Let me know what your role is on this patch and why it has been
> separated out from Bill's series.
>
> It is entirely possible that I am lacking context. Please fill me in :)
>
She's been marsheling some of the strlcat patches I sent to the
mailing list. It's possible I sent a "v2" of all patches, whether
there were changes in them or not.

The patch series needs to be separated a bit because of Kees's
'seq_buf' changes, which will make some of the patches I sent
obsolete.

-bw

> > ---
> >  drivers/pinctrl/samsung/pinctrl-samsung.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctr=
l/samsung/pinctrl-samsung.c
> > index 5ecc9ed4c44d..0d639eec689c 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1155,8 +1155,7 @@ static void samsung_banks_node_get(struct device =
*dev, struct samsung_pinctrl_dr
> >
> >       bank =3D d->pin_banks;
> >       for (i =3D 0; i < d->nr_banks; ++i, ++bank) {
> > -             strscpy(node_name, bank->name, sizeof(node_name));
> > -             len =3D strlcat(node_name, suffix, sizeof(node_name));
> > +             len =3D snprintf(node_name, sizeof(node_name), "%s%s", ba=
nk->name, suffix);
> >               if (len >=3D sizeof(node_name)) {
> >                       dev_err(dev, "Too long pin bank name '%s', ignori=
ng\n",
> >                               bank->name);
> > --
> > 2.43.0
> >
> >
>
> [1]: https://lore.kernel.org/all/20260915081910.4142719-17-morbo@google.c=
om/
>
> Thanks
> Justin

On Mon, Sep 28, 2026 at 2:43=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> Hi,
>
> On Sun, Sep 27, 2026 at 12:07:58PM -0700, Mariia Nikitash wrote:
> > From: Bill Wendling <morbo@google.com>
> >
> > samsung_banks_node_get() constructs each pin bank node name by copying
> > bank->name with strscpy() and appending the suffix with strlcat().
> >
> > In preparation for removing the deprecated strlcat() API[1], format the
> > node name in a single snprintf() call, which preserves the existing
> > truncation check against sizeof(node_name).
> >
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Cc: codemender-patching+linux@google.com
> > Assisted-by: LLM
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
> > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
>
> Are you forwarding this patch on behalf of Bill? I see Bill as the
> author of the commit and I recall seeing this in some series he sent
> earlier [1] and this patch you've sent doesn't seem to be a v2.
>
> Let me know what your role is on this patch and why it has been
> separated out from Bill's series.
>
> It is entirely possible that I am lacking context. Please fill me in :)
>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-samsung.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctr=
l/samsung/pinctrl-samsung.c
> > index 5ecc9ed4c44d..0d639eec689c 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1155,8 +1155,7 @@ static void samsung_banks_node_get(struct device =
*dev, struct samsung_pinctrl_dr
> >
> >       bank =3D d->pin_banks;
> >       for (i =3D 0; i < d->nr_banks; ++i, ++bank) {
> > -             strscpy(node_name, bank->name, sizeof(node_name));
> > -             len =3D strlcat(node_name, suffix, sizeof(node_name));
> > +             len =3D snprintf(node_name, sizeof(node_name), "%s%s", ba=
nk->name, suffix);
> >               if (len >=3D sizeof(node_name)) {
> >                       dev_err(dev, "Too long pin bank name '%s', ignori=
ng\n",
> >                               bank->name);
> > --
> > 2.43.0
> >
> >
>
> [1]: https://lore.kernel.org/all/20260915081910.4142719-17-morbo@google.c=
om/
>
> Thanks
> Justin

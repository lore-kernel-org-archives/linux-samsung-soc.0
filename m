Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794199628;
	b=OYrlJEYBG6oPmAK67YTFIfgpGK2n8i4IYPKqGeD/Srbbwk8jNnfWHjJQUDgAEdCvsEJG
	 z3tzW9mvBR0gKypIG0xkMlrBHRxCnM0TY9DaNL9Xfbnr5UamxYmfpMVxiZiVB60uT6yYI
	 //VcxFm6iS1jXPImU9amwDiXJuDBQuoTcJuqt0QRC467ZrWHBk2zY1ePMpBPb+L0CW4/2
	 Ns8ZB/2gPnlD2iGly72nPtJOebzEP5iUAEyyFmrUgfa62S/3/C5OGpuQdi54H76njae4T
	 dxTwn3ctx3VkUasN/Q/fzvCBxhq5aFSjs/N84mmBDCV5mDpT0TYR7FwdogOEztiSVYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794199628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CrfIutPa9zzmKoZjuVxyntYvgSPp8Myo4B82If1gVcQ=;
	b=rgjhdRcYhkwscZzdXcP+z2TgZDvBdr7Ax5xYSwWAKqM1IGwv9r3X0c9hUfM0L1mTUUFX
	 /NJV5G/F1488QkN4nDGfNFMouhPybYhRA+TUpHGMMuC1RC59LkW2WVrjzdgqX7fuDcV4m
	 qY9h6Jj7zB9oK8DQWGZW2mOhjRXFVx7FMLuFwdWRwwRfMZAPrQG3QiE0fB7JmHj6LGXqP
	 EzDP+7aztznMciBMFdze6kjDf+ZJ7vWw7Nb5lh11VauJgAuuSp4RhjzXbMy+DuRug/DCV
	 8Cr2eMUdjIZY5107FMQpSuMCrXytocprkFfEiXxeVj4vm01uCObt4UVv8Iq3fhCHa2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IohIZ1oA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738E9606A31C
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2026 04:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IohIZ1oA
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4c9abc1824so63683466b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Nov 2026 20:47:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794199626; cv=none;
        d=google.com; s=arc-20260327;
        b=PuuJHMdegP6h21qk36FYiI6d3bZIL4TieIqVIR7jJrGvze3w1KGobyk9CDins3ePXo
         bzsAZc90Rob91JZD3Ppa3fPS/EGSj3SD7VV+E1BjaFk/A7enqsdE/jmBzVw/fHl8Xlw1
         B+SjTc2ZbTpD7XdXrDwzxRjxx0+TaClaRqT+fP+LO1YN2lnhcUq19THePzYHNgB3nvyp
         Ci74iKEyvqAXM4uVKo7vMHfs4RJ4hOi9HFlGotvy2CIab0nIjXLaDQS/h39+iVBwsk99
         y7XYy0pG1/89y2GA4dPugcdbAvElQAbTkiHrwQyjfo8DleuX682nme1bffxJE27N+fq6
         4k2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CrfIutPa9zzmKoZjuVxyntYvgSPp8Myo4B82If1gVcQ=;
        fh=gI6JF0up5z19jy7IXwpRyiaLnxY31lYFDDm7VDuUekk=;
        b=S0zZbcuPw6P5vgZzKEJ4OmQ9qFJkZFeD0nNQfX7J1xjeJh2/kPLpYMPtZT2asqU2Y1
         HZXKsuxqaDiomKOpRrMpWXghaPC3+MwyxPp6eNupZKb7rNfR1D2F4qxy5rRLInUInwny
         Rwi3WxrtMJvwDhA0KvWG+ER7389dh+/KG0X0wiKH+av8RGChbdFX/VCsiWP203vMK7RN
         yb7hzyL5M10y49GTLJLCH4XsT0KYZaNSsANVojLBKFYi9SMg+LLkMHfQ3UegRwVmEoad
         V69zcyDOKf3zNoqUC8y/ka8ysz6ziZPg69hwSaoFSCY+oFEgCJ0rwOdImX3PxYmXiO2M
         Sv3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199626; x=1794804426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CrfIutPa9zzmKoZjuVxyntYvgSPp8Myo4B82If1gVcQ=;
        b=IohIZ1oAwy8qOm0JxhUCeKZegb1kHdjo/t+cANf/7fLgydjScBayHwnnUgDHSaLttm
         ple64bi6DGayMz1A8qOjG5ZT5ElqNiHTJPRimMGyBfL69snqjvHBAvjMcF+lmwevaDEM
         mfjTVEkJpfFs+Agk8+p1UQhV0hfmFZjhKNmvNxosswdeVzQ5K7RMDrx02PeVM+Bw9cqT
         BXCwAxVD7IJ5X5rr4/Ca8rNUADx2YwiN9y1Cecgk1c/PGIQKIU562xEeOKEdwq9PUBLF
         6+cXV5ozk8gOVkPd5awDEtgCxpqZmhiu8GZE5szOcK7w0G4MHzx9ZsMlQadyurlDscTl
         TJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199626; x=1794804426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrfIutPa9zzmKoZjuVxyntYvgSPp8Myo4B82If1gVcQ=;
        b=Njv7D7Cf1ud4iPyFHnvjxZlOIy/t766phnLDU9wlo/tt1BDB2fR6YD17xy0rLEcVq2
         jnoNg/CbAZykAuV7Gp1YAGUIDRzGGtTbDx/2Rj+uLMUxQ1/nMuGbRBKxGvVPVy8xXnjj
         cX3bQxO27Qu0Hf++5sP1QVM/3DFTJnc7y42RDq/HWVHK2OlqKdnu+NjIGlpaDK2RngWW
         POaLKxWnp0MI+Krpoy5Va0r2ZxRCjevSFMo0JDvmXGmL73S6EAbIs+2VbAxhFl1pgrpW
         XXInzE0/EBMRsDHuLJECZOXEUL5fRpfPAe38AJF+NI/UfyqeyUpJf8lBvFXOkmsoAfbQ
         +2Dg==
X-Forwarded-Encrypted: i=1; AL+hErGv32XGg4PA3G/H2X26+T4Wj3oInqVVQjYE5uzx05F+ZptHmZ/VCJYDbBGXSUd/7EmcXaLTRviXnn9z3wI9f5GuhQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/9/wwsqbp+/cxZk3pytiGS6Xr6Pb0LldmT3Ckh9e6btemMZ2vn
	1X+4l13yc/tvFjxz86CbueTVNyLlpfwbj5Rpgsa9EHBjNJAIq4e+wrDoEXbR3I6pV+4PuVh82ME
	NQkFmcCTi6hp/kAfWrJoCWTbqcSQDJHE=
X-Gm-Gg: AYBFou1RVhwIpHiNpvs9MZEzYI8PMyZ8Nklv9+K2baqffIcer0UaGnOQHq+Q32nsgeF
	wDFgk77k/Y6XIZwGhDUb/aXOA6fNn9NQUJqBMJt8y0XzuZcPDFpoq6pmA3ARSZ5OOBILC28XVY2
	kj3mXKiN3qa47GpnyADttAhSoLlaDfcBGVM6wJAF2QYkPGP9SMioiTrUFb7zB9AzDT6JX+deLRJ
	qlv5rRUoL00CKcStyB85C8/rW/MfUE3V0QqtYS9e3gLiuFYe9i/U6pLGf211dWU+/igr0rGwHHn
	8zkXG8Z81ckEoJGTPf7ntC+9SEXaNYBK7LAN3z47vOwRtznKVVdbWXrW0FstZkPbOpYWb7wq3dA
	W19iSzNy3O9Ke32F9QM29+hmOYpINb5wqiuokPP5LI8ukY3OXv8XL01uxsnshYm67dYg=
X-Received: by 2002:a17:907:3d91:b0:c3f:d8f2:f08e with SMTP id
 a640c23a62f3a-c4d6db3a64emr196944966b.44.1794199625715; Sun, 08 Nov 2026
 20:47:05 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012064334.3193085-1-thnkslprpt@gmail.com>
In-Reply-To: <20261012064334.3193085-1-thnkslprpt@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 13:46:28 +0900
X-Gm-Features: AclHuK-TjmziQBVGGqzRv77wQmyocEKBYuMMJR_pnwJjtYpt4X-8bxATAwTIBkE
Message-ID: <CAAQKjZMYrG6C5KWkbqcZX9Jdu0TVVimRksV7xNe=G=653S5PsA@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: free EDID on connector update failure
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2026=EB=85=84 10=EC=9B=94 12=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 3:44, =
Avi Weiss <thnkslprpt@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> If drm_edid_connector_update() fails, hdmi_get_modes() returns
> without freeing the EDID allocated by drm_edid_read_ddc(). It's
> an unlikely error path but nevertheless possible and should be
> cleaned up fully.
>
> Free the EDID before returning, while keeping the existing return
> value of 0.

Merged.

Thanks,
Inki Dae

>
> Fixes: f6e4f57fd90dc ("drm/exynos: hdmi: convert to struct drm_edid")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyno=
s/exynos_hdmi.c
> index d4fce39c2b61..386557a7f5e8 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -893,8 +893,10 @@ static int hdmi_get_modes(struct drm_connector *conn=
ector)
>         drm_edid =3D drm_edid_read_ddc(connector, hdata->ddc_adpt);
>
>         ret =3D drm_edid_connector_update(connector, drm_edid);
> -       if (ret)
> +       if (ret) {
> +               drm_edid_free(drm_edid);
>                 return 0;
> +       }
>
>         cec_notifier_set_phys_addr(hdata->notifier, info->source_physical=
_address);
>
>
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> --
> 2.43.0
>
>

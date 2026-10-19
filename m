Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792450999;
	b=XAa1NyNBINvlXOjilIddpwKj74AhorpLerxjFjrDJifGOUPhafHl9l5qyERWBeYul/4S
	 Or0SrHttW+W3FJNum47raY2AywZWJV9kiuhFLztY3f2Squ4DRgDfFdBSAfWVYTkgFvkgd
	 7awoaMAmn2QU6PNXv8oLjC/vS+eHMXmDtb2mo+xfJj9Q54UcnlBgSiWRwa/FOlRHcG9Zl
	 dry/JqvcmRaYzUgu2DU+TdpAa+goT7ioYzbZ9D7snAu37zfVo3/qQmXG13h8lH3o1m51y
	 B7BZRO2mSmYiM9qkr9CtwLRE68aKcf4xOXIMa2LdBGaY70fcpItQLtIW5Hm1g88qG3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XDtlaSExnYWqsMEa8VGfF5QYBt400ktE3qpWjPuxFnM=;
	b=SbYJMSwqJJ/Yke+E1uLcZg9ilwkjY42SiTxjm6S3YaPDGwPSmAJdUVxVNc1ia+qM0kiu
	 hJ45QqaqHRncWkQvU1w7zQu5iVfd4P8hMkStKKiasn94QCcsRtBUOZY8EYGE3WiIOmHL9
	 2PpaymOFKRwqM3E+/alFJJpZTnmlA9mZ5lTWYaZWeZ4w4RayRx81/fhJDXAshn/L6QJF1
	 Qg+FGxc5HcwyP2/Pf0VY6NWhuFgcZ0gM1QSavDaWLYM0sjOLb9LMjlGCQ197Bmpo5YT3y
	 DwXk6DFGyZ7dNYwSquHKxNkJpjQ23QH/Otg6ohFtzVKZVFbgWnJ9LO5Ycnw6yeZTNdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzzBROxD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3370D606A319
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2026 23:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3370D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzzBROxD
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c37b612635bso337547866b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2026 16:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792450998; cv=none;
        d=google.com; s=arc-20260327;
        b=RHAMVr1wM9gMZ8ft90+s8tMvqO+6VKJPZ9kwXDe2pe7EJtYBFb9mzEImHrRfz3hv7E
         IxtpIHZPyexO4pRG8ulwKzyBDi3sZSY4MQ4xfxf7RuUIXvGuXMkW1tp9FpO5ZsNG+tml
         /VXVk+keB/G1SsrOcdBdgd8Grz4SejqEv0sYSooonTeVBm//xlV01DJqIBQbjO3InOu6
         +8BcTRkahQg42upwJabztS5rM0NfLPuXOjiyk6fbFXVXa0+I1mXicg+T/DBYzQ1WNoQB
         xw1HcdiXv694wfOMOZkqZN8uLZrw9S2f2sMy9mSVf4hw4uK4BmT/oHzAI8kLi0H+DSGD
         oATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XDtlaSExnYWqsMEa8VGfF5QYBt400ktE3qpWjPuxFnM=;
        fh=wnVX1308OtIYuOoe1SPOtmAEo2hyHqbqOLa95UvnzHY=;
        b=MBJOCSrST/aOxBMotew70UQba+oPAnwbv9QEKc52NO9oPrB6RNJ5g3vzAdeVLtZKRJ
         In/CIchqPkVaXnoxeXZNtKsidUcXS0NeXXsBlU2XjhV1L439BPivKwpuGRbj66MR1LpO
         LS4kx8hzYfp1osK5eLTAwxtDKzgw5E0te58Oh0zUm4Rh8Iin3D5Dg2qwIxrGUbWZFGrO
         ftaaIyotR0Sma/Q7p+FulQ0NG2Vw1WDMQG0NL9g66TYdKP/lXdu/Y2AHk2++sBjponw6
         24xunQa0Nc8bP7C5e1gZp6lV74RLBzvL7R0ryGE1teyn9H5++pHEHa7TLHubTWCXbDdu
         vnGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450998; x=1793055798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDtlaSExnYWqsMEa8VGfF5QYBt400ktE3qpWjPuxFnM=;
        b=XzzBROxD32IdPg7PQj7Aj7TxdQnBcaRSj9035mBKfquTQx0kSnzkZMS1VhWweBSMB0
         Sfh2J+MBxVbQK73iQuJ+L1ZmHVS8+3aMnan493N9WGr8rLM8keCy5k68bvczfivpbs2E
         d24bsKReA/QrVBny9x68brCZh2uT/pj05oiV1qHcg9yELvChGFq6wcndflpIJ/fO23WT
         E0uVQPyCryvPMrfKPYXecICvOblfMvqSZ13fElkWkrqo/+azdNVCNASt6xEYaglEVCqL
         MZMXj/0At/h/fbycqLgYfcyffnLxBgrjuJV8XpQGLweVC8IFVekAu+tDbBL0V1C36tvA
         x0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450998; x=1793055798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDtlaSExnYWqsMEa8VGfF5QYBt400ktE3qpWjPuxFnM=;
        b=nLgtvTcZRqLD25PtZ9ueWlL5iFTrdwtTajTGtx25qiLr4HmJ1t0nZ5kZ7AacQAAak6
         mysXfD0BZ9UZEOqd6fO1LDQeLJYZehfIOmTIHaw44BoVG9FF8nKgb6iDRam+pFIJCQro
         l0si7smN/VMudM3DuKc9uWXN/yRgje9ia9o2gqBcy6hFxjj+oJxNG9tdiglfP5wwWNpp
         cV3LbT9EzLVnmZhcKY+EweuhE6N8IV4M9+hY+O+LbbkXqloLq9CJ8wlb01vmNhEq81j6
         u3H+AwoLZcT3dhdegDX89/FuEVAWVSoGbEmXjPHcc/AfkWfGQzEcc7mCRJiVj6Gio7gD
         vs2g==
X-Forwarded-Encrypted: i=1; AKwUvBw5IlNTrGcvE9P3MHaVRGRM8TO/zlKu3DrZft1tQOpR2Ino+FmzWltEIRDulQI3AgNE2w9ewkyksotYSATRqFcvhA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJCik/RUk4mC/hBBj9qfIfYq0PV4W0lXLm3qcQZ32jm6NdNFg+H
	yjAxtWjZLstPOdojGo2Q8DoD9hyg+adi5qkTmejDogxV/ELP0dVLnZqjGoVJgVuydg1oMcj3be2
	NDgeWJmyQVAJEhPZ2fB3zmzVnzN0Myg==
X-Gm-Gg: AYBFou3dus4Al598UTEzG353VyUl1JidxD3bVgcZN+7wE62dePxzhq2muwaY4L0QoCK
	T3U9xr5eKswDT27EfrexNfya4UNGG5zOjMQTTxnM8Dh855MAK18NuE5V7xt1Azkyw7XYWjhbd1D
	BrRR1duyXiI/MGD0GKzX/R1wr9+fVKEBOT6+rSQBfEPmAE3+hnszAxsLGcMAe8vGIIHwhy3+5XE
	uhv19QrlEWNeMUMccTx0k2PJqpb3aZLxAJo80WSuBD9g7PM+A28sA67smXiIu1oHZEBAEci9vLT
	Zx0TIgbuQskRSp1xQ/lOuS3+OMjMCWibRUAuQzCSGVl10bbCvdJ2Va2r3RPXkjQ4ieg6Y/kkrBI
	z3QNcY5fkKcOrd/2XCHRIeBU9VtvHqHdrYS4dYD7SpHUyBQfLhYYQKy2nk9AT8sNNReh2
X-Received: by 2002:a17:907:2da9:b0:c45:b99:f282 with SMTP id
 a640c23a62f3a-c450b99f2famr243449866b.7.1792450997629; Mon, 19 Oct 2026
 16:03:17 -0700 (PDT)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261018035132eucas1p2ccd8f0233fd196fd8801506c1c213b39@eucas1p2.samsung.com>
 <179229547105.3971562.9800339494753406560.s5p-cec@gmail.com> <6c07141b-e2d7-49b2-8493-394d727c3a15@samsung.com>
In-Reply-To: <6c07141b-e2d7-49b2-8493-394d727c3a15@samsung.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 19 Oct 2026 19:03:03 -0400
X-Gm-Features: AclHuK-b8j1-fi2uZSAQdYkd1yB7zxeS2EFL02Kkr6JbCillyjdAs-mauMrGRkc
Message-ID: <CAGEsz8G1k9O2CpA23vKmUFghfN-HTFhVUtx693A0whq-mSbxYA@mail.gmail.com>
Subject: Re: [PATCH] media: s5p_cec: release IRQ before deleting the adapter
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

Agreed. I'll switch to request_threaded_irq() and free_irq() in v2.

Thanks for the review.

Best regards,
Myeonghun

2026=EB=85=84 10=EC=9B=94 19=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 2:54, =
Marek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On 18.10.2026 05:51, Myeonghun Pak wrote:
> > The threaded IRQ handler reports transmit and receive events through
> > cec->adap. Adapter unregistration masks the hardware interrupts but doe=
s
> > not wait for this handler. With no open device-node references, it can
> > free the adapter while an already queued IRQ thread still uses it.
> > Devres also unmaps the registers before releasing the IRQ, since the
> > mapping was acquired after the IRQ.
> >
> > Free the managed IRQ before unregistering the adapter and disabling
> > runtime PM. Request it only after the register mapping and adapter have
> > been initialized, and free it on adapter registration failure before
> > deleting the adapter. This also makes IRQ release precede MMIO release
> > on probe unwind.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: 1bcbf6f4b6b0 ("[media] cec: s5p-cec: Add s5p-cec driver")
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> >
> > ---
> > Compile-tested with Clang, W=3D1. No hardware runtime testing.
> >
> > Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.
> >
> > diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/c=
ec/platform/s5p/s5p_cec.c
> > index 4a92d32..e83705f 100644
> > --- a/drivers/media/cec/platform/s5p/s5p_cec.c
> > +++ b/drivers/media/cec/platform/s5p/s5p_cec.c
> > @@ -199,11 +199,6 @@ static int s5p_cec_probe(struct platform_device *p=
dev)
> >       if (cec->irq < 0)
> >               return cec->irq;
> >
> > -     ret =3D devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_hand=
ler,
> > -             s5p_cec_irq_handler_thread, 0, pdev->name, cec);
> > -     if (ret)
> > -             return ret;
> > -
> >       cec->clk =3D devm_clk_get(dev, "hdmicec");
> >       if (IS_ERR(cec->clk))
> >               return PTR_ERR(cec->clk);
> > @@ -231,16 +226,24 @@ static int s5p_cec_probe(struct platform_device *=
pdev)
> >               goto err_delete_adapter;
> >       }
> >
> > -     ret =3D cec_register_adapter(cec->adap, &pdev->dev);
> > +     ret =3D devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_hand=
ler,
> > +                                     s5p_cec_irq_handler_thread, 0, pd=
ev->name, cec);
> >       if (ret)
> >               goto err_notifier;
> >
> > +     ret =3D cec_register_adapter(cec->adap, &pdev->dev);
> > +     if (ret)
> > +             goto err_free_irq;
> > +
> >       platform_set_drvdata(pdev, cec);
> >       pm_runtime_enable(dev);
> >
> >       dev_dbg(dev, "successfully probed\n");
> >       return 0;
> >
> > +err_free_irq:
> > +     devm_free_irq(dev, cec->irq, cec);
> There is no point in using devm_* API if one needs to manually free the
> resource for whatever reason.
>
>
> > +
> >  err_notifier:
> >       cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
> >
> > @@ -253,6 +256,7 @@ static void s5p_cec_remove(struct platform_device *=
pdev)
> >  {
> >       struct s5p_cec_dev *cec =3D platform_get_drvdata(pdev);
> >
> > +     devm_free_irq(&pdev->dev, cec->irq, cec);
> >       cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
> >       cec_unregister_adapter(cec->adap);
> >       pm_runtime_disable(&pdev->dev);
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

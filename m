Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C01639F18A
	for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240073; cv=pass; b=tjjZykd4/gbSHBqyBedIOuxTNokHs9by5htYZiu5r6ZvkoaQ8oN8602AZnHQdmpD3PtlfGGx+hq8vsq/RXb/OZWF2ees9j+y4yvVEHEtt5AC8DraIK7aDwmqbDp8en9J3KSz0nO2Gdi6qawybG2ARt8kKRjURBxhfyxi6ZAN50o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240073; c=relaxed/simple;
	bh=vBGRoQcJXlxAMtSg/Ev+xruoEjdajUUrjRvI4ba6Pgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWD205Y5aCrimH/5v1Uk8V6WBEUZ/2DHT7fHzXDg7ExbFKiL4AvwzQwtRPqtQLbvDMeM8ZJVT2sjzqJV3XotN40ItPZECKvUbPIDe/AzWwUGWLEUVCAztzY6ntwa9j4JnIBkYN/Aw4s78p1Jv2OEoIE0+wlOhzLecAcfvFOQgb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkapOxgQ; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkapOxgQ"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-87ffa98d4a9so18064677b3.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 12:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240070; cv=none;
        d=google.com; s=arc-20260327;
        b=Gi4jViybrKSYz41Wp+fOjQ6/lHoeYwwakUsRDAKFHX89VNS5hIohCFVmDIkLZMsEjp
         5Ly1Fz9TSmIZQmnKbh+Kx0srQCG9MeONnpBYQ7MTF85WTlKqUVwkorZcxLGOTmjGTM87
         6mRakWkqnfWR8KbFzw2D36h95S1Lb4Kb5MYpkxXxhyDM0BbkvnGKpiV2lN1OvsHvXow6
         tWSIFrHRN1A+fgjUaOjAdPWacLsfjGzpR3pviq/82Ta00UUML+qWcA9v8UlzCD4ZhMkl
         592L3kmhud/mrfGbRHHEsPCgBjE1jsy0Mjo3YJxb7YLuBqhvQw4FNfAKiVlvptIV3r8F
         27uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        fh=4DvxcBS6jkQb1vZB+rQd9Nzuu6xtMJwWrPaD0cXT6WE=;
        b=rqNRyELCE5XgzaUDYq9EKeStn6QPm7uL1ZsvWbCHwvmQhUcucyisSUWHoJ0tVNzo3L
         ZHbBfBAvriPt/upZp3j22P5NAN6wDrWmxriRxrlqbcJKr7eEBDjhwJVwGm+TveinLMpp
         bEEAE70F928vMLNBr8IN4aKLFo3SDv9e/aUYheqoym8db8HzYV+scUiySWTkfTugNEu6
         +D7RTrFBwkmW4y6ofKxY5YPNfXdgeP4c8zd1VGkW98E7qT89xNtmfdntXi7AODZPXxo/
         q4Y5JGSJqqFW8r6n4saR9s/pKxYTIixFdfJJKE+d/VY0lWhVpQEHof/iUs1ZpF18Fnm/
         E/FA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240070; x=1789844870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        b=JkapOxgQXv5ET8Qb94XeyLO5pdOFXllOR0Q2jHzDfQFmE5TApts78X36dzgsP4lV2F
         AJpPEUcDjvOL9fMptDgklbypBepaL7YvWJbxaU730rnc/MoZzNy6Mhu2h+zxGE+CJc5M
         k2hgcKXkNs6qxCDziHeQObBXqeI0kQpb+nlsaaUMYz0ugBeDOBKsSZK1/hu3sLnnrDSq
         hf6LcnHprhEv4+71lL8LrKSogYSjPi/n9si1jW/+mhYjriYOk1P037UAE/S8G2X5R7av
         pmPULYCr5onjsvJKFLbXL0cmoqgxlAq4gzR6aQ/7jJhtlhxPZVHM9fSYbghe748bl4rL
         qYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240070; x=1789844870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        b=Wn+li7m9zM6K8Ion2V2PJfirw3n7V6gZrFDvghL60bjvIpRa3eTxc8Jzw7z22GFkQi
         RZW08M1UaeVWs3JfDxJEP0y0BdMXTUZ2VYkoFZyKwiZuCb3mtZFBlAeGjA3pCjyPy+w9
         r6NV2czxmj+niOLglzJWzaUpiAXREJM5a1IPTFt6vbMvnkTncjWDoc+4eG6mNHWahFJq
         aRpLXuxxXrXVIFxygesYmD8dirvRAsg42wcvTWNjMOkqF5KEQp2TWoimhUD1Ev2yEpIK
         xYO+8IPNKuIkJtTkwKPiMseH8GouYgnJLAScRSNRV3ZgG4uvZ0o/O247R7jThn6GrYfz
         cAyg==
X-Forwarded-Encrypted: i=1; AKwUvBwXPyW/cI+qTCmT5Aofgw95nJlm4bHUBtdSjCwmQSl5OQx7EJCTNner2Wpah8mHiJdqkvIbWEih3LvAauhnEi+YEg==@vger.kernel.org
X-Gm-Message-State: AFuF++lnJRn33SMWNiHxVJNM2vf//hxV7bgXLU9BRtxfv4TRjjnsv1mF
	2TRHpmdYdv51ryLYAaUikN061PCj2uWw1YhEPKDZfbpqXg49eCz7OaqeaEcO+VtPGAf/Oh/VHBt
	fRZ/l0Sd4F/CCdaHjeiKLPSjTGYRfm8g=
X-Gm-Gg: AYBFou1FqshR+pRqj/0/MeKcYJGMnVuXuTMgJDFjP6K08Fq1MOdt93JRBjsQJc1FT5T
	Am1w8skn/dqo0bErH2CmsBuY7BendwLd+ftnziE6NfnAsKjOUwmdBA5wOBmXPCAHCVaqdvCl8Ex
	Bjkp+ITisN+NRBaVhXWuunV73Ccg97XuW/mL7hspk7UQSCtWvGIq6hEwgvyxxWweVrkIY1zoh+d
	S6DtGRxBQ1uy8OmQXnrCjIV6JSVm96LHd01+je6W5ks82g+jIC+86lOPlmKCvCm5ZlYF7m3d+ND
	zi9RtoHtzAnUYCr55ZOaKkx8qEL9SvHU7zXy5DIO1kEhEuCuFRQe
X-Received: by 2002:a05:690c:a790:b0:873:5bb2:6c0a with SMTP id
 00721157ae682-884b6f29b6bmr21177167b3.52.1789240070580; Sat, 12 Sep 2026
 12:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906061755.5103-1-sumeet4linux@gmail.com> <20260906061755.5103-5-sumeet4linux@gmail.com>
 <98a0dbf7-9724-4ccc-8810-645dfe715656@kernel.org>
In-Reply-To: <98a0dbf7-9724-4ccc-8810-645dfe715656@kernel.org>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Sun, 13 Sep 2026 00:37:38 +0530
X-Gm-Features: AcwNN1XqTP8GoNHaMkR4dokovXZ0UiUGTDkYaF2EyUFt2qLbm2siHwKKSL9BVhQ
Message-ID: <CAJ9orWStxJLN-0Dk2LqmyxEagC_nH-veS7wWrN_kXvb6WEUWiw@mail.gmail.com>
Subject: Re: [PATCH 4/5] devfreq: Use %pe to print error pointers symbolically
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org, 
	thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org, 
	sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com, 
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 06/09/2026 08:17, Sumeet Pawnikar wrote:
> >               ret =3D -EPROBE_DEFER;
> > -             dev_err(dev, "failed to add devfreq device: %ld\n",
> > -                     PTR_ERR(drv->devfreq));
> > +             dev_err(dev, "failed to add devfreq device: %pe\n",
> > +                     drv->devfreq);
>
> Instead you should use dev_err_probe and drop the last argument.
>
Sure. I'll do this suggested usage of dev_err_probe in different patch
series for *_probe() functions update.

Planning to post V2 for this original series to use %pe to print the
error pointers symbolically, reverting the change for dev_err under
*_porbe() function.

Thanks,
Sumeet.

>
> Best regards,
> Krzysztof

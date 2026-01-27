Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803D7139D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Jan 2026 02:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769481290; cv=pass; b=OsZq0w0/A6UZrM5bugXNN+QkAxxgHRdPfWK9xM8TfnHnb3oD1M1C16EDEXKSmXSP9cUldcoeVyQr7vAaC9Rr5S/y+MeZ8SpaxFWseQa1KOIw4hJTKAhD00byvsE5K8VroMWYhrWNQMm5kjRwOeIPEUSswoO6ksxYPJay6d59AM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769481290; c=relaxed/simple;
	bh=JFip2kLExDGxMI3IhhLYqAjmWzM0b5u9zb5Bf6gXzsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9J5Dydp82JlG+gQbUmSpdYsQOyD5pgnaDd+vYij3J5aNogpUNXDyx5C3G5kxVnlWVmMX1o65fD0biP+XN0asvl8MwlvDzhvdHUG5KFoAos3heUBmxJyntHr6x5tLA2aK/leJovJtEOEtK2X8AckZydjkWGKNpvA0YxnK+iQaFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=evJhXu9P; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="evJhXu9P"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1248d27f293so4938283c88.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Jan 2026 18:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769481288; cv=none;
        d=google.com; s=arc-20240605;
        b=QAHbgxX1DK87Dj+ZkoGgsray4GOO/GNTG2o4JTTDZa9sMglOaBXpKZv1KyQpN8rpDC
         PAuYjbVxS7uDpT2Egp4ezp6ZLgD8Y0hIcvTCfmTO3z1bJkJJtYWi2nO6BLcEIl+JTHkm
         sfX6WnnUDq/xRE3nwaoBL0OPSevoo1QyQ5n1LRlRMNONeAh2lSQlplJzmsnuHrX33dQd
         vKmUWPbNuuVZwcaQoX626vjmC7IAbLTAmKai+LCOPZE3D1JkKZkoN9BrTvl5sdDrlOSW
         D3N0ITE5w14dn9RfYJSQiK8i0ZhMjACWvjuDOSLmt7dZs5LMF3nGxUBvS2Hzn/4mwe23
         iM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JFip2kLExDGxMI3IhhLYqAjmWzM0b5u9zb5Bf6gXzsc=;
        fh=BYVuxeb6rDs2P4/k9b+ikR9oZ/LiZcWnIDxRk/KS63E=;
        b=jBjiDFQVWBbbpkJqdDN5JqcVr+JUz6Kbwxp5BQVneJ9KerSyg0Yah3/OCVQ6TCBnyt
         g0Ksw8T23fzqwmkBdDPB7EQc35MSlKzdu9tr0VJEgryWiNVGwOBnx9b5eD/sVLRnY34O
         5YrNf3q6zAWooGB5OWOkUC404PxIZ+AppjvBxUHfSmMVhfno9Pl8h+PbYzSfDMCRmf2V
         jqoxHl82mvEHHYWjWg72lE+R48NC1TdvcqzDJBXfDqVo1+x7jTNp9rfIZln7PlFh5lB3
         6yBrKkVUr7FenhXI2MrA6p1nyKJwTWHlZaS0B4xGxL+oqlmtHh96OdpKsqpDfDmbCeMy
         Rh7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769481288; x=1770086088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFip2kLExDGxMI3IhhLYqAjmWzM0b5u9zb5Bf6gXzsc=;
        b=evJhXu9PS/fdI6JnH8kIISVPOphrn2epAGCfyjpTfMfRaQXqB8Taoxh5e1mKelAPy9
         Y0hdQAk7CVcvioP+l08SUe420xnEzCkC89bl7h+u6pArw51tNo7ErjtxXmxJa6AkZsoo
         WZNuMA9kRvmLprrc/hd1/AYhCWBOw19WIBJeW4OtWsnNFVtnwXV0m/JjSPBSQCPpM3DV
         w2svhMY2NzaJXTKR8NVhbGU15VNZfIpTi8R6/RCinHsg4g9Oeo4evtBLztzdh+bgMrpp
         ph7IEuOQkYA+rZFx3HrdOI0t36NTZEfi/J4m8ZCwQ1YDf7BCQIBt6G+PsxjhOhpdHkfe
         M87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769481288; x=1770086088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JFip2kLExDGxMI3IhhLYqAjmWzM0b5u9zb5Bf6gXzsc=;
        b=YDQdYqiwTP1zcJFNQfJwO+ZLqoP+Olq290DJ8ueGFUTGwKWnD/u7YhI/da3h4Niaj0
         QfNqQvhliQ5PwiWBZgMtPkg76XECSssLcPpEMMfg68pvxVgTjyjFqQYqFWwRhos2gY3Y
         HjiQX3e+TOV3nPbNXpEBO5XRG71wkTii+Xn8mcsWiziKWLb30nfK1/YyScRYIf3Y8fYy
         8o15eSuqE11OKhqngHnoIeBj1nzohSLQB1TCJGKc+wkNmc6w1iMWmwFLAdqDcJA5R1WJ
         Cvq2pt5ZPDt1BFNqfe0POHLnQTwyeIiZsftbA7qfM4LtAfrREbRO/fXGqcwrgt8HkyRd
         Mypw==
X-Forwarded-Encrypted: i=1; AJvYcCVcmuFo4HFYzBK4MEhzo9zElMOvw9HJi7I/50bgJhL9zSNoie9SrsOzr6P4UEMMg1DlEbu3BEyUuL0K+mXA4bO20A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWPNu/IVC5t/JyvBLy3X8ZSb9UsFW5HczTJAE++QgG8xBx/wN+
	3rFlb1lf1kpRaT+/qXcljIvSKR1vF1JtA6F5hSRBmtflIlbiXftrmndwW2y9hAUW/WvFz9qMTjj
	i7AySd/t0wdwqK0t7ZJL2pkbrIbKQvuYhQr/VOVmW
X-Gm-Gg: AZuq6aLvv1aLLZ22peRj+6VHz7As0lqvYOTLpgtTLroFUBQFnc9rFp5VEilKuQxD3gq
	FwtzueZRnFQzViwntwvyTIuZOrXAGIkVYm8TQUaYCMke75JOVPOG3z2EHvogdw0gxPGnck4oyec
	kR73eknpB6K9FqywsPoqY/0qQJM7h2bQ3F8LPJgp2HiWljYJkinZB+xgxQg9kieXmorFz/C35Dg
	hsSCm8YBb7XDCPLhDnRQldk3zxmIXtHfOhy0YkO3ExdCQILyhoO/mnQNZAuZk90ruacP1oaSS1U
	3NHFtMI1kKjImMnRrVFn6TWjHs/Q
X-Received: by 2002:a05:701a:c94e:b0:119:e56b:c75b with SMTP id
 a92af1059eb24-124a00c7356mr169215c88.32.1769481287984; Mon, 26 Jan 2026
 18:34:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-next-v1-1-c18068b091b9@google.com> <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
 <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
 <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
 <CA+zupgwEWM4c9yK1f-Y_Cv5gk=0zYNuUb3kZyZ6O3FDRbPPvKw@mail.gmail.com> <eebefae5273bccce2d0fcd97afe3ea28bedf27cd.camel@linaro.org>
In-Reply-To: <eebefae5273bccce2d0fcd97afe3ea28bedf27cd.camel@linaro.org>
From: Roy Luo <royluo@google.com>
Date: Mon, 26 Jan 2026 18:34:11 -0800
X-Gm-Features: AZwV_QhhJrxrvzBO-TQhPiIPXuGUoaw8HO-KdRUINuCSkmnzos1YfxT_-yBlkN4
Message-ID: <CA+zupgztBHTJwNPEOfXjdw9TpcpiVGO=hdFBYk3PUo-0Vf95mg@mail.gmail.com>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google Tensor
 USB PHY
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 10:52=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
>
> Hi Roy,
>
> On Fri, 2026-01-23 at 15:51 -0800, Roy Luo wrote:
> > On Thu, Jan 22, 2026 at 10:28=E2=80=AFPM Andr=C3=A9 Draszik <andre.dras=
zik@linaro.org> wrote:
> > >
> > >
> > > COMPILE_TEST is not limited to ARCH_xxx. It allows drivers to be
> > > compile tested even if the current build doesn't enable whatever
> > > option (like TYPEC).
> > >
> > > See also https://www.kernel.org/doc/html/latest/kbuild/kconfig-langua=
ge.html#compile-testing
> >
> > "If a config symbol has a dependency, but the code controlled by the
> > config symbol can still be compiled if the dependency is not met",
> > TYPEC doesn't fall into this category as it's mandatory for compiling
> > PHY_GOOGLE_USB.
> > With "depends on TYPEC || COMPILE_TEST", this very build error
> > would resurface when TYPEC=3Dn, COMPILE_TEST=3Dy and
> > PHY_GOOGLE_USB=3Dy. Please let me know if I missed anything.
>
> No it wouldn't. If you look at the build log & .config from the reported
> failure, the error was because:
>
> CONFIG_PHY_GOOGLE_USB=3Dy
> CONFIG_TYPEC=3Dm

You're right about the cause of the build error and sorry I gave
the wrong example. Let's look at this build error scenario with
"depends on TYPEC || COMPILE_TEST":
Given COMPILE_TEST=3Dy and CONFIG_TYPEC=3Dm, the
"depends on" would be evaluated as max(y,m) =3D y.
Hence, CONFIG_PHY_GOOGLE_USB is allowed to be
set to y, m or n. When it's set to y, the exact build error
would be introduced. I also tested this locally and saw
the build error.

Thanks,
Roy

>
> built-in code can not link against code from a module.
>
> The typec APIs are all stubbed out when TYPEC=3Dn.
>
> Cheers,
> Andre'
>
>
>
> >
> > Thanks,
> > Roy
> >
> > >
> > > Cheers,
> > > Andre'
> > >
> > >
> > > >
> > > > [1] https://lore.kernel.org/all/CA+zupgwgfKwPYqj8G2tNf4pEXNEWA+vL2W=
YJPhJ16xExgko7Dw@mail.gmail.com/
> > > >
> > > > Regards,
> > > > Roy

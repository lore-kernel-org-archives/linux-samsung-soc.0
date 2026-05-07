Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B107392C4B
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 May 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143437; cv=pass; b=lNRX9aVycsXSROjB8C5L7DSCJR4YKBtczxdsYK5xkleq52ouxW8uuX8WeVog1+6HYGhi/nS9NW7o4arYsQfM0BEKwh1QkCXGQsfsZALe41UrYb0XNCPIA7W0N6QGvyVXTo+VtVnDek4nt75EPEnDYM1u8ze+v+YpOPhj9bQpLRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143437; c=relaxed/simple;
	bh=V7ma49FkYJcCWGCL389vm+sTxnEVG3lw3+caRpcBK4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaHaxWQXQarMhoQQkxu9e/HnTQKEjit52rcUZIjVGvZEZK2ONqEQD731H/cvTRwMGXGO4aWtYqhBoqdNAVMwqsdKKhGGZTngcpyHIde0rk0R7WT5by/kc4SApRvqdiVFXHJneIuCpFc0v917ZNEDzxoHw8B/1Q4OsJPDiHT9JqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnU3BZ+A; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnU3BZ+A"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso1047536a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 May 2026 01:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778143426; cv=none;
        d=google.com; s=arc-20240605;
        b=j5TvLUgiAHF6YE9QxJMkyVApg+GMUf8haviyy0qEM8qSAVTQLd6NBf3AhswmvXKSHw
         0L8pNodX8hoMtX8VNvWALwwDn6eDgrJNa4/doJxQ1KBCiJbPaU0896Fs2O0QRZVv2x8M
         UeUeMoL4KdyIBNy3+kIZG/xj9eFxFE4I3WGnx87RtxgNVBEgKrc+lbFWmVfhTnj03f/2
         gUidkuUmAVFjbVGl+CQt6a8DYKfhSKWsIGH8iffyt/djM7iIOGfAILsI5JGb4DDsv2Gb
         WutjSwkRt5n9DlHRxt3RtadfLw1+Bb5Qj3z0/o4RicrB3OFCQJmOJBiSYKHN7xt6AgxH
         uTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cPfGi80pkrEIBYkOE6vfVIEYDa38ruK3NtL9UiWIuzo=;
        fh=wSl08CwEq3O7m63iPk2jbfEMGHDwgvQpl4GWPcIOsvM=;
        b=UiNJwTvfGOITua7oL3sr/4oGSJ9UddF2ffPvfkYED6GAFuJED5/yT7Kd3In0dO7Oy/
         fPvmUfpFz27MQXeSW3v0Ugv1s9ccSpQagfjaBS5+fMk/xoJZEJY5d9xXVX3d9AfyW/UV
         K+6Djg2GRtyL12/SipSv8KBFjzEHLP3yHNqpaAXI1he856ioSUsnIpVL023q8GRSn8Bw
         Ciy0T8lbBhuYFNYozVPMPnlhxOUwfENwY6veTa1BczFi49Nx67JU/fhY7fyy5BcsiOT8
         6OT2fhID20F3lai6HGsR+8EZaJ9HvYOa7WizlOuTFeRI7gUjG/S6+MKxRV2HJKtzPvp5
         CuvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143426; x=1778748226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPfGi80pkrEIBYkOE6vfVIEYDa38ruK3NtL9UiWIuzo=;
        b=qnU3BZ+AMX+fCls92OZ1QIqmpkgCoeLR8FZI5pZw/63xbzg/rFqfpn4Ax6wr4urz9u
         DQc0j6hDGLS/anviRyUln31c0i0IU/+LOl8sGHa0wOO/MZ1LZQyuJCui7vDW+sPCiyer
         maIch84YbySfjwkFo40QXbylPQYopknaN54/WwPFHvVKH/sPUBYYTbPp85oh9naofQZA
         pCN4zdUk+n2yT7X2v9p061a2AbHVN5QAdt/C31j7PAJfW2eLHYlIEcafSn4R65IYGPyV
         YdmesX/7Lw7vL/CowFX/llMZ2v+W9EYW2bO+6p1iDOI0Z1FzZ8ipNvopmS8Rpr5v2jTQ
         D2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143426; x=1778748226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPfGi80pkrEIBYkOE6vfVIEYDa38ruK3NtL9UiWIuzo=;
        b=Z0rLBnJWP9HoAgmc5pLw5Xb+g3C02Gdku0L/J3wtJlihmicp28aCAfVWZHxwpEJ6d9
         n/oy5f1vbKLOwg8UbrEYd1Vzhb9up00FmTKr+Qww/TaWWaaRPaVZrmzzYHXnLXkzk2sD
         bx8E/Rs7hP2Gh7RlHgGqfpWXteGbrWVuoGgAhhSCbvUP7HeP1EvYQvzbfJItOC+6x+gY
         JEJ3coQYOaMXiPzPmHggnLNy6NTIHgnv8mLbLKg17NZHPUIdjCE3TZPQpuP7Av/4dR21
         Io8Ic59By41zND2mLwoy1NGR6V5OfIx7V3l8nsXbTZ+djAsSPIoWgfTLM1/8N9HmXxeG
         SqhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xnA/rwl2Dj4jzDYPNtgR927x8cfeTnheIL/IRSMvcK73lmNPrAUFK+MU3nGLqjEUsJwsVNx5cq4v5HMx84PNnZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxow8shFqp4D9MFhvnI48pVeh+YuYv34WfUmtOreP7TB/+k7LwE
	Ijye9KFmX07hPOlckeBEC5CC/jwgkUw170+tL6isoYPdmXq4mYfOoPayAJOAwdNjLEc7jczDIA+
	1Y9WyURp611cD5ninGAKWhKz15vmnsOU=
X-Gm-Gg: AeBDietU/i7Wn7mFNofFDXdviM9xzSo0PaTjB9GImNulU9XvFcjUgCXknloAiopf2jP
	YomjNOoXZGaNM3UB8PsM1wQr34Kb6rHDV2I9Niw2PKyBAX9ITR/DcLrN0jkX1q4mqEbNnEK5J7j
	6HfX198Rt5kTW4662SrhNy4KGjbK/z9hxTwmmZqHmkcQvyQN0k0Dt+v81aRDhZUlvhHRI3i56xK
	clWGpSbznuA4AiJWFzmPqWEuLlfsGmBNpsC9UpBEVSviy66NKv833Hxeu2nDdx4BlyhGoKvH2Pd
	HpdZnB6z+iTILPS4Hwdz0Z/0M4hJKVX1FFaS5SXwSU6J0+WfdBsEACjC9N5Lj4Psrl+DmCipXj+
	oEzO42HOIvIjLScWFyJc/UhTqjinOYSggXsbwD16TGIRdjDdGQOMG1fkJi2ffbAHs//X5
X-Received: by 2002:a05:6402:540c:b0:66e:43ef:2951 with SMTP id
 4fb4d7f45d1cf-67d638ae7d5mr3725735a12.4.1778143426001; Thu, 07 May 2026
 01:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506233833.178357-1-rosenp@gmail.com> <4c57b107-e1eb-4eef-ad77-021d9669900d@linaro.org>
In-Reply-To: <4c57b107-e1eb-4eef-ad77-021d9669900d@linaro.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 7 May 2026 01:43:33 -0700
X-Gm-Features: AVHnY4JM2dxCd6zuxzhCeNAz9P3fP-g5qTDGdrW5tuHIZgkThcJR8iARdOQf4HY
Message-ID: <CAKxU2N-kx+rOibE1uc=gAOSFPkMvv1w6nZ9nkPutY-Lq3zEQKA@mail.gmail.com>
Subject: Re: [PATCHv2 0/3] clk: samsung: use kzalloc_flex
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 1:33=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> Hi!
>
> On 5/7/26 2:38 AM, Rosen Penev wrote:
> > Switch three structs to flexible array members to combine allocations.
> >
>
> What's changed in v2?
Fixed compilation by adding back samsung_clk_alloc_reg_dump as it's
used elsewhere.
>
> Cheers,
> ta
> > Rosen Penev (3):
> >   v2: fix compilation and reword descriptions
> >   clk: samsung: use kzalloc_flex
> >   clk: samsung: cpu: use kzalloc_flex
> >   clk: samsung: pll: use kzalloc_flex
> >
> >  drivers/clk/samsung/clk-cpu.c | 34 +++++++++------------
> >  drivers/clk/samsung/clk-pll.c | 56 ++++++++++++++++-------------------
> >  drivers/clk/samsung/clk.c     | 11 +++----
> >  drivers/clk/samsung/clk.h     |  2 +-
> >  4 files changed, 47 insertions(+), 56 deletions(-)
> >
>

Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBDD3515C2
	for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 05:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789192385; cv=pass; b=NEJresVjkX6wGkLooMTQR/Sp5VYAmGS1c1SgTMGNzlqKNKo9YmzQ2sLkllGHdJAqKHlqcZeIc6JKHhHGybtjS4RbEIUczAfV994RezxaNV4/8LpwtZrFGgvw/eMAnessuX5D7MwVG5uK58tVevlfQeVNoXzT2UG+bW35VDSyByE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789192385; c=relaxed/simple;
	bh=/9I8y5ZkP4ODohDfo0OYtleusAr+6bIH54mMhnAsLO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kNqhi35wkx9+iY3G9aLZLor6T8q8PiVIeZJC/ofJnXjO04DT9y9DXgIaGS7SxFmCbGoziuMBgF+Y6qPEcyhJYml7wD31YdRPx9jL2pcuzp+94m0mIjA6ybUFp5AQGCUYJJbPFDCORwDj7Pa+GkxOoy4sD8LMqBjg/QdeZNkIxRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LYGCH6kb; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYGCH6kb"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aaf2ec5so238376d50.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 22:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789192382; cv=none;
        d=google.com; s=arc-20260327;
        b=mVIRLaiZ9IN/O4VuFCrxYtXrVEdSjTrNX2t0rEaIAGi/UelPUjxoRwemQKfVOdIWPH
         g7s35RZAVjv7kN4iq0yTRalEAqUYjHGt3aqFKhCC+cPM5Jt2+QD35LnbVxMp/EXGWdS0
         Gx+7GW/1wNsmNEn9OhQg7tX5nK4Y/lv0I3393gKj6QDxbegZ45dgxHVzl6IwWrPAY4kB
         xhvcXg2+95rjZ58/L1RwBUXRVkMhBpIc5+jnZaEBmRJ55Gc/iXo8OCEQDW4CcoPrvOT5
         bzZHMBv5/5JLGenS/Cipjjg9OM0e6qFmoja4NdhSXqygTzYLHnT4UTmb1SlFbTLhKno2
         NeeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FWSKXBlRVQK4HizOnCRfHvGpk/soRBqoRAazsxuWHOM=;
        fh=cv+p3D0hYBCuZaxbFr5VhDPHPf/3AFUiNl+/wPasqDY=;
        b=orBWeRzaJwvEX6sSrN4xfLn8KiN0KZgok1MCIGgj78k3a3bpgsP2sBg46+/cBCtm55
         PR1LJeW4AqITqGIspP97z6tz6j+iDfGrWyoM0uOE4wxXfH+4xvuvw7/rM6K/DE2on9Mw
         tbK2521n7FoDYux7uquW3GWn43ZV2gb5GcjFoGizaTTcAj5zfhhsw6E99XDVIV6GqGiN
         DKKtXWqQuUM3WTSR3hegyjaFyxC8qWx8ZnRQUNBDFewVZkP1G7UkwdYMHIqUApK/s69i
         fmIcUOCerq1+g9YMZcCZbRKI8PtC2ADASU7hgFraPGx2emhxp9XsYmrCjUvus5v7hrTb
         zzZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789192382; x=1789797182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FWSKXBlRVQK4HizOnCRfHvGpk/soRBqoRAazsxuWHOM=;
        b=LYGCH6kb/pJnM18MhFnAY2ZweIGLD2gEr8TquMj5Wp2o1YHBCmOjmVlMhxe7pHU4wA
         SjwwNJAzt1Iv95mM0QdzwGmde/IwmLrcJ1IecLjZzg/OQeQ8r7JRU/BwJ/0HEJRJXwO5
         EZzyi7L2kwvMGswxTtf4tPZ/asl6WehHJZ6ZNxx5SvneJESCV9/D2+YmQyooCrIO/c/d
         3Pq4+CqIaBfOibCRbLWeepp/AtIw8pYj4OSs9ZRbUB4bcQyZ979JyqA+z3+AYkcTfU48
         4gd16PzKluFocHTc5/Sy0+Jhw02fbJh94/8NrIiyZwRb2rkHXT14x9VN3nozbExedER1
         fMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789192382; x=1789797182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWSKXBlRVQK4HizOnCRfHvGpk/soRBqoRAazsxuWHOM=;
        b=tGZ9Of20/PsbBlK2y9qqsZJ7QqHCBffp4aVzv0awRhs1VThsyjNquUzwfZUBuW/5BK
         /hManqLaBG+tjMys/KkxgdNKyaTdakKXRUNsbUqib98NgK5N1OsUJOnLojOqVXBLNjZG
         lWtskkoXAuqoH+yFT6+TOlGBb0eC95dH4wVOHizSvdY8AyOhN/d1KiY5V3fRVpE0/efW
         SUxwBHZKJtF4ypkZfPTGEFbogG6kU3BTW0z5pGU+xmLiI3C1shzPV7eydqVJv2nadbgQ
         jmMhw0jjuvv5rCkLkD5jzpeWi+7L/uebcOlYPwEKUVls3mRDGDItjm7JAIJG7WUjRQY2
         K9qw==
X-Forwarded-Encrypted: i=1; AKwUvBweNN83U8ZTRgiw1a2XM1UadeFXBQXRfrbmOFl8rZ+jOX/+8Jrmn1Hh0ZlcP0JWOUT9WkM0s4Z4DxyFE2sGYiAVFA==@vger.kernel.org
X-Gm-Message-State: AFuF++kpc1xR0DSFzr/7nx+INzPjl0+YSbOwIosCtG8NCXd70goBUSrp
	CXtN3lCy3+zUn8S2gOgmYv6kFnPLvrgm6YVH9L5nKQQqgiDxd0xVE76qOFQeUyWBzV4JuJ++v0W
	cJIwOoGKMREA8t4fvJi6J3rwPNSt2T7I4Kcn4y/nIqw==
X-Gm-Gg: AYBFou3zw9aaCktlHhiakEEZNmpIbFw1s/wsavNg2t6jy5NqTZyE9RfZO1j1LRKzreE
	BWh6INqQMMGkCp7GHi42rTrD8TvnFO2azF9MmE64UdBHdSev4luc3/Makyl9ZI/JXREiKRL1+r3
	CPKNg6bAGxmmcDPRAbKjEwwBfyYMWq4C5Bsy3E78Iri46vzva+LErXAWtrpAZ4G1dNa7leAgVbl
	Ia5GAQIf6hixeoHzo9sMYsoMmsdEjVdkbIHNRwJo7e8ctumItAHCsfWLzaWyNgzf90vPLl2MTaG
	dA+xVStxjk8zFLm96rOYUcYarn3xBd/5wggTy7kZkqd8DXrGEBWb2FWYk/7TN7MZg6di79+u2hX
	muBmtylfD2aLXnA==
X-Received: by 2002:a05:690e:12c2:b0:66f:c1be:84cb with SMTP id
 956f58d0204a3-67135a1d461mr326324d50.57.1789192381752; Fri, 11 Sep 2026
 22:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
 <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org> <CAPLW+4ntx8qLy9jAYYdT+XwxwKHjvisutqEi04oPEQny8auD-Q@mail.gmail.com>
 <DLCMHTJ9SYL0.3HW3W6N3PFYWM@linaro.org>
In-Reply-To: <DLCMHTJ9SYL0.3HW3W6N3PFYWM@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sat, 12 Sep 2026 00:52:49 -0500
X-Gm-Features: AcwNN1VD8BCzWQBSI8YU3zjpwgpLQB8VunevE0JIHRoygZZzTiTyguyvXbn5lqw
Message-ID: <CAPLW+4kS-75pC46xFSwb8oUUvmyTOysNGrei8h-My0=2d0p5hQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 11:20=E2=80=AFAM Alexey Klimov <alexey.klimov@linar=
o.org> wrote:
>
> On Fri Sep 11, 2026 at 1:42 AM BST, Sam Protsenko wrote:
> > On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@li=
naro.org> wrote:
> >>
> >> Document "samsung,exynos850-acpm-sram" which represents an SRAM region=
 used
> >> for ACPM communication on Samsung-based SoCs.
> >>
> >> The SRAM is consumed as a whole, is not split up using child nodes and
> >> properties related to this are not required.
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com=
>
> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >> ---
> >>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Docume=
ntation/devicetree/bindings/sram/sram.yaml
> >> index b83fc6831947..b9c4d4f3199b 100644
> >> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> >> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> >> @@ -43,6 +43,7 @@ properties:
> >>          - qcom,rpm-msg-ram
> >>          - qcom,shikra-imem
> >>          - rockchip,rk3288-pmu-sram
> >> +        - samsung,exynos850-acpm-sram
> >
> > Is there a reason we can't just use "mmio-sram" for Exynos850 ACPM
> > needs? I can see it's used in the gs101 device tree like this. If
> > there is a reason for this, I think it might be a good idea to
> > document it in the commit message (probably in both patches).
>
> But isn't it already in this commit message?
> "The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required."
>
> Also: https://lore.kernel.org/all/5797be19-8886-45a2-bfce-eb7d5f0df6c2@li=
naro.org/
>
> Do you want it to be re-phrased smth like this:
> "OSPM ACPM should parse the SRAM and discover essential data (e.g. queue
> offsets) for establishing ACPM communication. At this point it is not
> expected for any software entities apart ACPM to use SRAM so the SRAM is
> consumed as a whole, is not split up using child nodes and properties
> related to this are not required."
>
> or
>
> "The OSPM/ACPM IPC should parse the SRAM at runtime to find configuration
> data (e.g., queue offsets). Because this SRAM region is dedicated
> exclusively to ACPM IPC communication and is not shared with other
> software entities, it is represented as a monolithic SRAM block without
> requiring sub-node partitioning."
>
> ?
>

I was thinking about something more like this (in addition to your
existing commit message):

    "mmio-sram compatible can't be used for ACPM purposes because it
requires child nodes to be declared, which are not needed and make no
sense in case of ACPM."

basically to answer this question directly -- at least if I understood
correctly what was discussed with Krzysztof [1]. Other additions you
mentioned might be valuable too. Anyways, that's just a suggestion, I
figured if you're going to submit the next patch series version, might
as well provide more context in the commit message, but no strong
opinion here. Also, feel free to add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> I hope if there will be other software entities then we will be able to
> fix it later.
>
> >Also,
> > should "mmio-sram" be added as a backup option (after comma) in your
> > [PATCH 2/2]?
>
> Sure, I can add "mmio-sram".
> The compatible =3D "rockchip,rk3288-pmu-sram", "mmio-sram"
> and compatible =3D "qcom,rpm-msg-ram", "mmio-sram" are used in such way.
>

On the second thought (after reading your discussion with Krzysztof
[1]) that probably is not a good idea, kinda defies the point, because
for "mmio-sram" you'll have to provide more stuff in the node, right?
So I think it's better to keep only:

    compatible =3D "samsung,exynos850-acpm-sram";

in your [PATCH 2/2].

[1] https://lkml.org/lkml/2026/4/14/523

> Best regards,
> Alexey

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612073;
	b=fgzFkg/wan3gZFsCpD5zHCFE0rcNGz2ERD48QxWlT0VlsASxk7zEMwbC7KeCzOaW5TQW
	 J34ZSoQ3n16eNbnCU0hCY8IcWTPthhAFtdvasC6hpFG2b1msA1M09xTZzeLcrv3LGvJOm
	 Kt/A7K/cCHK9t1hybytRPQRIT1tEdz0F5uPFHAuTVQSIVkvmfgHC8Xps+TN5ALH1eoFs4
	 qRtdPQRt+WsV5Ts0ot78umBirmwc7VVW/YYjeSP2nro0Z9WvovNn1UlGg3KJ06/8Re1M9
	 tm2VPv5mUZHkjTlESn4pUVhgzaJYnPlE0slP8QzX982BSvoEMObF59J//IuzPBbMWxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
	b=5SLvMIsxAcrwg3NK9LKYI0VWUKmDx8zkFNIrt0FjZ3HfyGXooVbVlGSOM9WZmYveHBt5
	 b1SgvUlmE9ywOJ9ukV64fAjek5sgpjRIlgeck7G/XoxfPVNGu9VxMpejcnGdWn0cEjPAE
	 E8Pnygay2BaK/vcn3Xe0RhIMVpUkBbAAIj+vyJfyQqqYdFKaUOdbqrTnIP3Din5x3g6pn
	 iosUYvQEn7ib8uze+y1lbRb1hM7nX5Cw34qdfvcYSN2j6x4dMyaaNhCO9yxWp4SrmT9pC
	 VvRi2qcFX61ByQS0WF7nIm39pncc7x7MoQy2WoD/kSF99oD5Tht+DhG+26/0Kv6iuag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ik9OkEdc;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A54606A326
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 13:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A54606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ik9OkEdc
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e46e449e8so3696890f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 05:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612072; x=1796216872; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
        b=ik9OkEdcz0lBWXP3zQhg/dxf+nRVg711ZuXBfy+HlYOb4kDY/FWHt+10HsOpArGfZO
         jBFqyB5gltkyarPZ01Xe5kl0v8bzel/Gg8iEMWoV7BwjCS5TYn0pM9bnJfiHRGXj/avE
         bc+JduR5pBXQkWa1Xy7BJtVpywXMbOZADSRkJ/XSgrsKc0WCLmOoD9Pdkx/eFtZPeUnr
         FJpcz0+UhBz64iLV+IXJH3d1g2jXf8G2PxJDd5XpQCGI+ZPSXWRvUYmoMhk0mFJuGapZ
         oP3pZTC2N8D5VFtECpr3nPd5IkufySQfxXAnDB8RqyYAh/4XhcxvpOmaAUdM43nAcWfs
         Vuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612072; x=1796216872;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
        b=XjqkW+p3zeAFlMRo2poZyQ/7lYba1jpMVTLUrXy5sIA6uYGvpTCVkf44pTqsoacrvw
         j0VPmDwuijxHlMeLg2jtqMkvuKP2YbnUx8C0r8Zfavk5kh1IkwTWVkMUck7psBBrziwB
         n3XFYh5YxUBYwccFDxEADpvPybSaoo5e9Gmz9jOvuSylUP2So5eOESh7c3DKHkNls0Xk
         R3C9KmEqX2RvFuOGA1cZ2gbuacLdu0HZNGVJvlf8bB9C0uujQMZfLS701Iza9zElAXBo
         6d2jpiIZkZ0X2L+Ajw917/ph0msOCgZzQWSFbcSPclgXHfDLkk5nUnp/asLmq7ZdhVTb
         zCTA==
X-Forwarded-Encrypted: i=1; AL+hErELS4Gtt7lu8fmyQcsvZuNp4pgsd1OvdTl788xGAy0Xp6ZfJi3JLVyCJiTLZyrPhpb0sZOJxBbuHxzFadcY+lwIAQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bprfBMIxS78jP3yJ22o8AGQLdHQihW7PzlJvSrpOVh7QDmG5j
	imQEr5sLFmYhLr9mEneuccr1Q9jdS0kGofwb5hIit1w8jr/+yPb58o6I
X-Gm-Gg: AZFdTZcTADx3smTjiFjtp5GGeVErUEDhZPzkPfkaPXXmL2ecpupAzXiw6VcWrZrrpCi
	XAFUmKvkGOz/w1+qbnGwlSIEnhforuAQ8/N0AuE06xk3so0XJuZQzZPvYK/yonPbaR7N3SXVRlL
	CQhFumRbyfV3tMneepdUa3EawOq/fMAV7X49+mtlvu3eBWZpn/vDpejeKRmo+DWlYveGsHewoO6
	g3xJ8V4VmaRWxon8T5JvJpOnyRVTOqTq6bK7MR5c0spT33GelOWFnfqcjXVmhwQR2RwrgRxj7vx
	6NzyPtKf9Z7Z5DURVAEJ5UQm4faIpDD9bbCvYRibyhp7ChP3jxlbVZ8XXtgzeDHcSbMNQH/7lA/
	F1NjjVapMmT8xJaTeAUGNheswfTGQzV18Up7j3atbDcPaS9t0FuXmU5TFOQ3ve176uNjgb7UiOj
	oQRPq9bxIabTmTUooURbELayE2nblrJPd0LOX3NqhrSR/RIRF1Iq99rkBq+ciklVzi8lDKMxtry
	X3l2bQWPv0gTISeo7+cpiSt5rlFMefFUzxC9bIQe451MT3KD8ctnhkTMjgWpbzhnxoCvb8ZTrV6
	QMFHX/ECut8pGryYdl11aaf+0nieg6Ftd2XqYlhOz3iznzdACI75cihGJgfiXufIcSP41j16YiK
	eqaDfGnOIWrafOKFq2+4ETpqoYKRo
X-Received: by 2002:a05:6000:2089:b0:4a8:647c:f963 with SMTP id ffacd0b85a97d-4abb964289amr35929140f8f.51.1795612071506;
        Wed, 25 Nov 2026 05:07:51 -0800 (PST)
Received: from [192.168.0.10] (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm33783108f8f.37.2026.11.25.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:07:51 -0800 (PST)
Message-ID: <4ed7e2e27c221ab900b1562c2a578b78c3c663b7.camel@gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add
 Exynos7885 support
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Wed, 25 Nov 2026 14:07:50 +0100
In-Reply-To: <179560526391.84329.2026344704407829230.b4-review@b4>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
	 <20261123092244.1792040-3-virag.david003@gmail.com>
	 <179560526391.84329.2026344704407829230.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-25 at 12:14 +0100, Krzysztof Kozlowski wrote:
[...]
>=20
> > diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > index 8af0143c3e47..f62e3ed82257 100644
> > --- a/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > @@ -24,6 +24,9 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos8890-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos7-dwusb3
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: samsun=
g,exynos7885-dwusb3
>=20
> Why isn't this enum with the other entry?

I failed to realize that that could be done while rebasing the patches
onto the current tree (as 990 compatible wasn't there before).
Fixing it in v3.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: samsun=
g,exynos850-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos990-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos850-dwusb3
>=20
>=20
> Best regards,
> Krzysztof

Best regards,
David

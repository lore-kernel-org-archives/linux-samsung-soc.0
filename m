Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794999082;
	b=Bnzh0TOmNC/1jKxJBVQDCDEVuQWErbmDyRPz8dCLaQEvhKeVfYwdfL5jxWt6+6Xioc/8
	 LWpWtQznUb+Q5bURLHG6iO2RCwwDXsek5xqzyqwGsBj3L5AmampjRbwuSGISRGEdqUgmU
	 oxh5MGh6K34at/y+C/lA62XgSBAlCVkvK/WgYx4NDtCyoMZl/LChgQ2DLtE98EO9uz7Qd
	 vb2zRV5SaliXZ7ZsEuxO9gH69Pi+dlIKxvrBDhx/3SEsIGtL+ST9dSNLPRaz7FQ4cXDC1
	 9J6hDr9CTJA0H/0AmfsXVX7pLUg3pGFKX9WSXBeOeG4BJJr6+gzIUm4CbstuPd7hJbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
	b=IKK1FXU2PRvJvHIVZtoLAcRWLWbwwa6bIJWbCNWliOCmkwr07JCtwZqhkpM822WqTA6p
	 JEwRQfCIqdOSjSRz9e+5MwX6e43nj4eFter1Iy0a3hqXgnue6hFnZPyxWVIgr0lt522bb
	 H99wEoF/qJY8tZBd76+l9yJd1Gd4wnXGbkmMBRvF/d9JoXT4qIIRpPGVoJRYDOpVaE6uR
	 hlxt6uLPS7x16wUgzRKN6e4b11S7DC5lW3+vth47Hlk2CH71ukrozrsQBq01AtNd9gm3r
	 MnNQd156MmRav8H3d5S4RrN8uOXgGQ3RpwUprdncZzNF4km+un2X+0bzu64v3WanxfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uzGy7acL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C58606A320
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 10:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C58606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uzGy7acL
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso2270189a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 02:51:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794999080; cv=none;
        d=google.com; s=arc-20260327;
        b=e0NrOkrAfG4hkvkBlVfPMBsiB6WHOL5M1Ii0SI+czfIaiX/nEkYD1qiJYlPCdC0f6J
         nPM8y5cTbxlnluDdo0SAKXJRrsKWdSoz+QWaP5n4mqWfWmMzaGxWUTfNc3v4JrS5O8Vg
         KcgVW+lz+ymONtVjbLzkXV1y2SVqccpcDgXTBOfncIx4Rvp1SyoTni9Y3lUH0dz3rpuQ
         oWzcJoCnNYGK6iDLPJqaYvTCDafE6/eCvQBi1lY9+zK0kZa8JOJSdEjwnQDNP0TRDQoP
         +x+0yB9FK8neD4saWZJwYmKJXC6sax/YaUt5cAvVgqfWD1HySp97fmi70BQHfyYBNryl
         2D6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        fh=pUUu3qndKJQE76KWh40b2XJGJNgpYXcd3kEYyNw6zWQ=;
        b=Rb9LnhF+FyEbRMBSmVMP+hMPCPdT4aGao1JPjq+9KYbi+HH1r52VbVKunaqeCUuVm/
         Yj8GukE1fyvK8xXn+3z/4cwwlLZRBAU2kmOqhor8T0DD/Aybt0vWW8KNpU/8SFCLPUOU
         i9d3jIUr0OcnWyyEZknksKRKeO+Exsna3rDEwKMEzQqzMXC+PT4A3NNTFJxty1wAc5+5
         YEJ77hGASle5En7KEFjG2ZJOapbtl9Sw+1QrDfINzZjp3mi3R1rzUWOk1KnHQIuy9am6
         OhdsP9ikZ2R7QErczrRw/rJEWuuFHYSqijPqIuj8BLTNAiUOZHJRoPSAOLxdCCD2ENBw
         v3Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794999080; x=1795603880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        b=uzGy7acL7JuuRoYHzLCV05CAVl256ema53eZwWGcIfsJ4ScGO3EcF4VCAxcAkoruNC
         wU6VGwNFXzYXBni75pukdRy1iA4xaO096szSWrf2aN6iDVGhs59LzMJwxxYbPhru7CJu
         9fzolDtFEd+ybxINOVJ/7oI48WxDFqdb8pw3SPTKyU0zBdypMFGcuGEo7kojCBQ0+OWV
         z4lftMdE3Tinu0jTJWiy8vAgPZEr1elRKk4fKNxpPDTdNow67v/0gQR/jezZDRDQSc18
         PEeioPSLmy14kn0e16zukPCiTWmvXsqU3wfSZHBU36kOatBY6iBDfcEgUVdwwHSQ7Ucw
         N04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999080; x=1795603880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        b=a5q0N7E2MAEagYaMDabpJVenxYh1MLgGKhcak732L7HtiA76hiCpXEjhHeUEKmENQT
         73dSHOruli4v4Lh77IIBuXkv+sd2C7fjpD8S2V2muMIGyaDQ4qL4x1CtI8r+FvRYf0CS
         k3Pfdwc8h0HA8G/k4SqV35i1iuxvrgNN8IB99sB4ivcUHMqT1XiQS6g/ti6FbwCp8fRx
         J5EuCVFc5UsV5kPicb3IWxc0BTaF+s/v/lNn8C5LrXIzHpaIHWjAnlj6E3Cwvs85SKIU
         5yxlhhK7EN3490NBvI/vpoeW/IKEpA5I3YBF7EEhE7SQhtF3Z7sj+/w5oZJFJtova0R6
         HuGw==
X-Forwarded-Encrypted: i=1; AL+hErGa8UfX6T+j8s4xrow/HdGzPeagPrgZ6bMMCKPSiBoVjwDUFvEfvV9Tk4DUQjz0vuui/Y+w5pfBaToI2ZboCTPzBQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9UANESnmVWKqN88mK3iFuoGRfjVKG+WJsrgcEAqRSyB2ZUsbuK
	jc02ujFZzyAVMGagyQ4dQoXQY8LESEsRFPsbUdVc9yuFnf0EWeukJqwzuaGAkQZeRokHqoLPi3K
	/gkjJEOzU+CKFqvgbRFmlP+bAao9PH0RyUkHuGqHdMA==
X-Gm-Gg: AYBFou0aD59W24e+3UNqGCtSfxH6tkG7TtCfgKhCllj4+5W5lCvCkvevyCCWfVx2g8/
	cQWGjmDO1iuFzdQ4XKFlSm0uQq+mPV+oTK6CMRyHkLiP38KM/nbxdyIiHJN36w5wwkFcsgvTt03
	bKKbDsxQey42sMq6GRfSwobqJlLr9KKuGm77w5UcJt/+f9J9TD5bWgGkZrId4apssCi17L2TzA2
	1CGbDNdMVb/s5ZgbAehSmf4JVjammo8aILNtaKHDkKYg/BAmLNNypBVAD7W1yyQ/oOdDuhtDkSg
	utp0Vm9I/2248VkTr0K+BLRBczC1tWy2DLqq954ii5EyacyaqoqOzL9fFtL4T1ApmjJwGPVni1b
	araZlbzySaG/gFUTmcJS0E6w6oclv6nCxpBKYYBFtPDWL4fNcc1/JbPK2hwZWIyOnKRP8SY8=
X-Received: by 2002:a05:6402:a513:20b0:6b7:a647:d6ec with SMTP id
 4fb4d7f45d1cf-6b887f0d11amr1156171a12.5.1794999079857; Wed, 18 Nov 2026
 02:51:19 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com> <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com>
In-Reply-To: <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Nov 2026 10:51:07 +0000
X-Gm-Features: AclHuK-Y9_U7OVUZSj7mMfHViEYJaBBmRFeKE5RJI3gsS9G5CebJQE_OwkvnRns
Message-ID: <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for
 Samsung Galaxy Note8
To: =?UTF-8?B?VHLhuqduIFRydW5nIE5ow6Ju?= <nhan.094.vn@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tr=E1=BA=A7n,

On Wed, 18 Nov 2026 at 08:43, Tr=E1=BA=A7n Trung Nh=C3=A2n <nhan.094.vn@gma=
il.com> wrote:
>
> Samsung Galaxy Note8 (SM-N950N), codenamed greatlte, is a mobile phone
> from 2017. It features 6GB RAM, 64GB, 128GB or 256GB UFS 2.1, Exynos
> 8895 SoC and a 1440x2960 Super AMOLED display.
>
> This initial device tree enables SimpleFB, PSTORE and GPIO keys.
>
> Signed-off-by: Tr=E1=BA=A7n Trung Nh=C3=A2n <nhan.094.vn@gmail.com>
> ---

[..]

> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x0 0x80000000 0x3c800000>,
> +                     <0x0 0xc0000000 0x40000000>,
> +                     <0x8 0x80000000 0x80000000>,
> +                     <0x9 0x00000000 0x80000000>;
> +       };

Does the Samsung bootloader not pass a correctly populated memory node
for the device? Or is this required because UniLoader doesn't pass
along the memory node it received from the previous stage bootloader?

Peter.

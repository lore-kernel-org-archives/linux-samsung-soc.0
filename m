Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1064E19D06E
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Oct 2024 14:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727792661; cv=none; b=SnQAIkSMsH1Vy9M53FNqyrHDU1Sjtdvl5j0toTd+K2Y8daRkMeI3yGfzRjd7lbGw1lTXZzobjGPRIM75lBQCkFSzIC0FI5HuNU/AkhEt3BJwevGy3RBZ4hhBL3k3jwYOjPQgM2acGdIbgmB819Ky/ULEBr4dztUPdD3Oooi9/UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727792661; c=relaxed/simple;
	bh=l5BM5b5k2TCeltBEWllLsPAl1pVOeHprS9AfvY9vl3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bg9NxrT+Vw6NM1IXu9AmLYXJ06LeKeNM4Bs5sLNndbynI3qLrEhRgTI0//dQ/rCj53CcVFGPoBatFwQP/KGNmRGYDeZNNshMhT/VJ26Hqtwn5hna3ondr12wm+aVlklhmGDKslrxVfZ0/5BcefJtjPN1Uk9cJFytREa2ySqVG60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9PUZspV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9PUZspV"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5398e33155fso3616721e87.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Oct 2024 07:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727792658; x=1728397458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5BM5b5k2TCeltBEWllLsPAl1pVOeHprS9AfvY9vl3M=;
        b=D9PUZspVorhQtsRqfM5wsx/gttEoAbJ81qsgaxxtysDkPGiodxQz8tX82vPdKVbeh3
         UHeKYdcWoeO4nXam/lPEgxs2G/CnBJxblUOAhvopKeKQUw3rxSudWwT5WqZwt+U2g2mm
         G/QBEXgpXTVoEm50FBllIsX3RM9EifxGZGMIFfnspvCTeegjANensnwRotenaT8YzyZh
         ODbH+bxye3rkhybmVKjo1RJAsPfprhgTXaKLBzqcrwP+n23ZCv8zY8F2ELOaDkmiMu/T
         B0YLrawa8BOmi4AnKVhe9f2YLkRh7+1aVsgSXEGAqTqNUN0roRI2CsjRCsa8PMR0aQWK
         UWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792658; x=1728397458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5BM5b5k2TCeltBEWllLsPAl1pVOeHprS9AfvY9vl3M=;
        b=j2pckROkHclvpe9RJvDPFFvuvNHSoLWQ+QqKTh3tfn4m6ZYrwZwVLMmn85+qDNBJxr
         OOnGvGsloT0hfzWdKhvfEFGM8/+kpZ99vkGGl0yEigdkWvVGkHEFNZsFrWBUkjkJ5QX1
         EMwqbXXGSW86dmYNHpp7qupyHFdMNA5ywdzv925HlSsrIUvj2IqXlFzCtdfkh9ga2A5A
         kRDtbDTF80e1UDnOMj37JtcZO+GP8/Lt5gcZ0e5a7cRx8yGtQ+wnPVQmB2b7+J3Or28c
         TYSAAslU+vCQtZ6eKw/4aPG5AXCNiDYLVlDel2MD3pIKt5b04k3pPmarTnz8ZAuF0zYh
         miJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEgY9xiNDFYBBMw1lgVVTJtI8lY11mo1zZPe7RmbV9xP4+TUjZt2oK5Nhe61amkk95PwOfx25jmh279a9cLJa4XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOKh/Mdf2i9W6QjzptyfRs+kBV7S+HtKUxWTyVSQTSnZqEL1Pz
	jq9nbdDWGZgfjFp0bWKLZzijL29DRQ3lRAIIc7Gt7dWzn6KX2+7cOZpGzHin3UXtqzMvGGAeNwT
	GlZZSusHeSZus0SBe+ndUtRv7yhH0UQjivWmYoQ==
X-Google-Smtp-Source: AGHT+IGh+SAH0HiND+WOSGwD/VcAkilCZpxlY30ljLulS1hHuVO95SRQIQeLKJV15FnjaJtEFiG6shIsDh0YJ3psq+g=
X-Received: by 2002:a05:6512:39c7:b0:539:918c:512c with SMTP id
 2adb3069b0e04-539918c5352mr4435735e87.57.1727792658142; Tue, 01 Oct 2024
 07:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 16:24:07 +0200
Message-ID: <CACRpkdYoVnG6dSpawFvkj-2KthNKWnfo8h_icx+-5_JLoHVDcw@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] Add minimal Exynos8895 SoC and SM-G950F support
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 5:45=E2=80=AFPM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:

> This series adds initial SoC support for the Exynos 8895 SoC and also
> initial board support for Samsung Galaxy S8 phone (SM-G950F), codenamed
> dreamlte.

The pinctrl stuff looks OK to me but I expect Krzysztof to queue it up
and send me a pull request, he keeps the order around the Exynos
pin control code and bindings.

Yours,
Linus Walleij

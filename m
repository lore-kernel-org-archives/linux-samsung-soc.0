Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97576524CF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jan 2024 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lY+6josP"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-783234dd689so81614485a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jan 2024 07:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704727812; x=1705332612; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yzw/cgm0NqSiQjobJ8Qq3PX7WH99Q7opW3VxmOxNOVc=;
        b=lY+6josP6BMPTp4bR4tvGbsOd6mdEgpAadcly5LWlQadAqv6cgoWlDr1tW6WjcSzx4
         8LJjvz5HGluFQ0FN41mX1Yp5TllNoVBMfmkk8vVk1uRD0eFdE1CRQlLww8khbgECZT/M
         ZUe0pUl94wXOhjV3ZRpGVvXnQRpAHuflMTF+doZODKjId3G5F+kngjf/2VEnqb+LSsw2
         qdXpPL+y5mI+XhilGbmtg1lBd5A8ZM39V6Y8F52TAmkTAnU88dA4fHiukhCxpZ/wBo4O
         pXzLM6jfTQnIXtur4UnVsr/B0980TDais4VYwzfJJ7LH/7gT10mysYfvkpYKTS6oQWv7
         3Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704727812; x=1705332612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yzw/cgm0NqSiQjobJ8Qq3PX7WH99Q7opW3VxmOxNOVc=;
        b=Z/45fxK3kuChxwHPN+AkF4HlEvKwWMN52KnboMMbxubzhj03lopBLhibRWrAyJI1mU
         JPX4/8Ibqs6DXMJk8PieMMqzt3nSelEML2gC1sgH7Y6klh4synsN5fPKAudf4uHab6f1
         YmkhVgCHuvN+P6aZuqb/89jaeSZ0OZEK2blFEdFWG1fqmFVPE/l695XqrjQIk2SEH/Se
         KK6c0ZBT78h3kVUPbpETIhJNuuUvOezGYY5OezQqVSUHQsAmWkvI5ibJ+/GiA2TSjWoK
         Oe8xGX872GOiwF2vx/TKjGmsaW9W28tEMZPTfxwuQDrBSQTP9zziLrJM8d/yISB2YGUz
         j90w==
X-Gm-Message-State: AOJu0Yy+h618KZeLC+vA1YeqN1mZpibpFAzAtkiNY0seIcU0c2/4fQMo
	INYvTR8wls34Z0Uclw5Flj/irNnFRAB+I/sc99jomMXqXCGyuw==
X-Google-Smtp-Source: AGHT+IFYKrhFgbRYAiEyPYoqEve1qSR2GT6wdqvLM/UdItQ5yRGST7HVQm+lQQheC7taXe1ZY76iPAlFAoLAEnpj6vY=
X-Received: by 2002:a05:6214:1302:b0:67a:96c7:4c90 with SMTP id
 pn2-20020a056214130200b0067a96c74c90mr4913500qvb.38.1704727812403; Mon, 08
 Jan 2024 07:30:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228125805.661725-1-tudor.ambarus@linaro.org> <20231228125805.661725-9-tudor.ambarus@linaro.org>
In-Reply-To: <20231228125805.661725-9-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jan 2024 15:30:00 +0000
Message-ID: <CADrjBPoBPrQh+73eqk_oc0VXFqJrLhY+BH4m9dFN=65QnpB4DA@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] arm64: dts: exynos: gs101: remove reg-io-width
 from serial
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, 
	andi.shyti@kernel.org, alim.akhtar@samsung.com, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, semen.protsenko@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Thu, 28 Dec 2023 at 12:58, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Remove the reg-io-width property in order to comply with the bindings.
>
> The entire bus (PERIC) on which the GS101 serial resides only allows
> 32-bit register accesses. The reg-io-width dt property is disallowed
> for the "google,gs101-uart" compatible and instead the iotype is
> inferred from the compatible.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

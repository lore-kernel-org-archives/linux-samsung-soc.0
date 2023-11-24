Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AzPHkjBE"
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE9AEA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Nov 2023 23:43:13 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a00ac0101d9so215987266b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Nov 2023 23:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700811792; x=1701416592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyUAYuQRX6aMv+61STKF6DNySvEa6Ul2fK+eQe9Bzg4=;
        b=AzPHkjBEeShulv8K4LG1wkczHy/A8/2BBb+G3x73Ct7DXxdxZCq+z9J8DeOAhTP5ga
         oyLKKhMVOUjara2VTKqxnfDjZHYeu01Q+i1dhvcsArhjRwqL2ZSp+PuFg057GkC2roTC
         a5dXiUHxPtjCANxRJ46DlQDppshETp42Xqj00xaPr6OfyEMEZiU7bk7lT5H8kft6agv6
         27MGK2wkKUHWam4sc8dMD8HvaQt1voOGWXAo5aSzctEHH3oPvXrVefxhgA6v4yWv6eIp
         AmuIcsGXsCUWi9s02VvqYRSmXpWyQHBQyvFIEvOvPZUkrTEcg4kHDQbIGPoQ1A8YuYwt
         LL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700811792; x=1701416592;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyUAYuQRX6aMv+61STKF6DNySvEa6Ul2fK+eQe9Bzg4=;
        b=pg12k8VdyXV0nsTfLWL6nCaU0iQNLAbIByqx7os2VSjKbHg7CDeuPIM+Lp0tRSwTzS
         70Y4Nov2TQRqSqny73TccAQLQ7wXrNzAvkbE4mxf7OFZJHLKSBzTnINO1y/gNQEgD0w5
         OGqNakQJ7wOh1d0x7bGT8nhUyDt8RHdo3wVElwTyuU+rdRQJPIsn45UBVR7l7njlloYk
         hcWzcH8310ag1GDD6NRnaSs9yUh8iXHDU8mOTULr9efYmOsM78JoIvoY8TttPkWOZSCG
         H0CG53Vsxhz/DZOdRnJT+HOqXIIGvOBC7kamt6B8Z/DZD9Lr9WpcWoEzglJiztmMg/aW
         VB5w==
X-Gm-Message-State: AOJu0YyrZnvhcc30mmdlx/+6Q8C22e71NtZ6n0tvaQL2DpiV2Bq1n69m
	jCof/GKU6yyiLhcd76t6OvWhmQ==
X-Google-Smtp-Source: AGHT+IGnXq0BeOtlIbT4kEQh7doVHdDRII4iYS9KqxdWl5+fcxpPtU+60o/O2lPRB2xTa/94ly1y0A==
X-Received: by 2002:a17:906:2707:b0:a04:c9c4:8fc with SMTP id z7-20020a170906270700b00a04c9c408fcmr1296326ejc.18.1700811792060;
        Thu, 23 Nov 2023 23:43:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id q13-20020a1709060e4d00b009fe16be6a65sm1739448eji.63.2023.11.23.23.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:43:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomasz Figa <tomasz.figa@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, semen.protsenko@linaro.org, 
 Jaewon Kim <jaewon02.kim@samsung.com>
In-Reply-To: <20231122200407.423264-2-krzysztof.kozlowski@linaro.org>
References: <20231122200407.423264-1-krzysztof.kozlowski@linaro.org>
 <20231122200407.423264-2-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 2/3] arm64: dts: exynos850: use Exynos7
 fallbacks for pin wake-up controllers
Message-Id: <170081179070.5541.8769953964405999458.b4-ty@linaro.org>
Date: Fri, 24 Nov 2023 08:43:10 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Wed, 22 Nov 2023 21:04:06 +0100, Krzysztof Kozlowski wrote:
> Exynos850 pin controller capable of wake-ups is still compatible with
> Exynos7, however it does not mux interrupts. Add Exynos7 compatible
> fallback to annotate that compatibility and match the bindings.
> 
> 

Applied, thanks!

[2/3] arm64: dts: exynos850: use Exynos7 fallbacks for pin wake-up controllers
      https://git.kernel.org/krzk/linux/c/2d8f82dd322fbaafc9c1a70d70efb6efe42c973b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


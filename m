Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZe4Qw9D"
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A8AD5B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Dec 2023 06:07:06 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bf3efe2cbso8000551e87.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Dec 2023 06:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702476424; x=1703081224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mpP4FYlQiPUrh7uh0fJ6KTyN1gKE2qxwNTY74r7how=;
        b=LZe4Qw9DSx91S8VEjP5F6O/2Mfdwcf5v5CH+yrSQeUVPbLCqxb6saLFtH0gdNDFfXF
         6guQ0eYz9iDwRTK8DkwfeF+WCMyHyVlTQC7Gp2WHK2W1Y+2O/5a6Qn1iy7Q332DEGmwE
         aDL2Mt6RiNoPOlICDtWxXnSqt52VcxdkQogIPKHlPGzwK/W2qcME7jEeRFLF/KNRp/ma
         Qzg9TX7JtDxT0tcRDPJGMO1ZdfeTW7wOTTwLWqfWQDKpaboXZqgomcON1Y1XFw2iDFoz
         9UpplhI7ogKSafB/P7D3XZRv4+D7oSmTP0n60vhqrwNritrc+K5S71z4VyzYhIG92WoY
         +EgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702476424; x=1703081224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mpP4FYlQiPUrh7uh0fJ6KTyN1gKE2qxwNTY74r7how=;
        b=cEwWJAyh1LxX5LwlADBDmzEcCp4UHpeZyTqic3ewR1CIJ1gSyXLqpFBgOiNVlb4xq2
         v+fHKtF9I6VqBMD4HIY7xiDM6D15P/OWTbCDrm4zsX6cbP/71OlrU0J2H/FONwuW4ixE
         dV03ZXDJbIB0DMp21XfgU71FGioTP+qgVqJOLk5dKTc995YKRz02/QAZVOBJpRgJspEx
         8QIvlOzyp2YFUKE0bJ4Z5C3GHupZ+16/nOpladA0HTea1kTlpeKHnOD67cnqF8QvbL2L
         y2YtH3iC1YoFu2SZGrH+RkqoqLOxogbAjgHfSOyKzoIlZyBQRJGA9Xf1vR66sO3XgHHf
         agzw==
X-Gm-Message-State: AOJu0Yz6Q3QeYVXsrKuSKqSEx3OLE6tPWC+F2xP/l7saZVp4ecUeAR0/
	4EKaYJBf1uzi3wkl8RrhLOtO3w==
X-Google-Smtp-Source: AGHT+IHLaGkIdnxeJBM1wGEeSYqCk0pgJ7QznFWs/siqTln1+v9poui80bpgefiIR9FIPcfUgGi6ww==
X-Received: by 2002:a05:6512:2210:b0:50c:2135:cd4e with SMTP id h16-20020a056512221000b0050c2135cd4emr2244766lfu.14.1702476424112;
        Wed, 13 Dec 2023 06:07:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vk2-20020a170907cbc200b00a1f76acb08fsm7037903ejc.134.2023.12.13.06.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:07:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Aakarsh Jain <aakarsh.jain@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	m.szyprowski@samsung.com,
	andrzej.hajda@intel.com,
	mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	linux-samsung-soc@vger.kernel.org,
	andi@etezian.org,
	gost.dev@samsung.com,
	alim.akhtar@samsung.com,
	aswani.reddy@samsung.com,
	pankaj.dubey@samsung.com,
	ajaykumar.rs@samsung.com,
	linux-fsd@tesla.com,
	Smitha T Murthy <smithatmurthy@gmail.com>
Subject: Re: (subset) [Patch v5 11/11] arm64: dts: fsd: Add MFC related DT enteries
Date: Wed, 13 Dec 2023 15:06:59 +0100
Message-Id: <170247641057.38939.10066985368657963484.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206063045.97234-12-aakarsh.jain@samsung.com>
References: <20231206063045.97234-1-aakarsh.jain@samsung.com> <CGME20231206063140epcas5p1ba86525117f4d9ec9172ae7cb18b7420@epcas5p1.samsung.com> <20231206063045.97234-12-aakarsh.jain@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 06 Dec 2023 12:00:45 +0530, Aakarsh Jain wrote:
> Add MFC DT node and reserve memory node for MFC usage.
> 
> 

Applied, thanks!

[11/11] arm64: dts: fsd: Add MFC related DT enteries
        https://git.kernel.org/krzk/linux/c/a41d9b3287b1d2d737984465e6efbf09a4fb51d2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

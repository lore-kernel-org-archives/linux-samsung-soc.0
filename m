Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SMpVsTMq"
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67445100
	for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 05:57:50 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a1d450d5c11so474238666b.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 05:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702216669; x=1702821469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MXVQUF9hBZSermdBHqSrHFHjSYaowAtJg9NEr1OZEw=;
        b=SMpVsTMqcwEFEGwVT+yllfIUWxyFzwNYiWaPGhAfWPeEsgTOyMBSX264uXslrGk7e2
         YXJ3697uwB7aWMj+JdzK4m8adY2IVDWFsvRWdBc1el8SUwVuJrtlWSqlVRmxeKLegI+z
         PHckKrIT3L8BJUmSm5FwHdClScbYzXu2q6eDieUZDDVOigtngt5D4+32JeF45ftEi2mS
         dKQtEmvNxdvbs++4L86RyH81KU6NA8acqC8B5YC5tDQOrDPjGcA/9pfL5XJD169d8pII
         5Ki+TX2qSnuNi4vnzy3/sUZQd5us80DOGlyFRUDrxJDzjs1EBjfy6wVtdrrOmXZYAzhi
         Aibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702216669; x=1702821469;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MXVQUF9hBZSermdBHqSrHFHjSYaowAtJg9NEr1OZEw=;
        b=mZDgZmao4PxVWrNrJ8T8oCGaXri37omTAEajti5GL10mNzvK7DBr5BLvEMFOcPTZSU
         MhM0xfrUKbfHz5VmIM9TDBQf13c+CaVH+XL6YJurz77D4MlLqvufRzYpWm0Set9u4uiX
         9Ph7hFvY/Hse5LPBVYD2eazVaXSM/aOTKqoq42IZKDGICoMuw7U+3tt8j8xIA1FWoE8T
         rggag0mjMqkdI/2D6CYDswNwIVmHwSK4WGJ1vawOIJHsw9awjFEM5VJjZCDDXJPfF9TE
         VWQg/qF2EAYctlVmWytv1f1Vd6BgJerjvLRobq31Jpo9xhpAAc6HE0l1Ce8gWjJVrPnr
         ctuw==
X-Gm-Message-State: AOJu0Ywuw1shtZxgl0ENO5he4Au9U7rA9o3hblIN95+q8t8xPILFTVHZ
	MX6X5YJxa0OY4dU/soLZ3KEXvQ==
X-Google-Smtp-Source: AGHT+IGD6qb1/At1uCsJLOjEwryh2b+ycrxGGw6w0Sxcmi0IKmT47n6y9juHoaKzTw5rY4NhKL3RaA==
X-Received: by 2002:a17:906:197:b0:a19:a19b:55dd with SMTP id 23-20020a170906019700b00a19a19b55ddmr1382260ejb.109.1702216668825;
        Sun, 10 Dec 2023 05:57:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vv8-20020a170907a68800b00a1d2b0d4500sm3442809ejc.168.2023.12.10.05.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 05:57:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
 soc@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel-team@android.com, 
 linux-serial@vger.kernel.org
In-Reply-To: <20231209233106.147416-8-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-8-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v6 07/20] dt-bindings: pinctrl: samsung: add
 gs101-wakeup-eint compatible
Message-Id: <170221666553.44902.5488217525830070811.b4-ty@linaro.org>
Date: Sun, 10 Dec 2023 14:57:45 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Sat, 09 Dec 2023 23:30:53 +0000, Peter Griffin wrote:
> gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
> where more than one pin controller can do external wake-up interrupt.
> So add a dedicated compatible for it.
> 
> 

Applied, thanks!

[07/20] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
        https://git.kernel.org/pinctrl/samsung/c/abc73e50b394f248aa8e7ecdfbd4dfa52f8e8355

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


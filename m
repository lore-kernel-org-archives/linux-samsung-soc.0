Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yGBKuJG/"
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95746DB
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Dec 2023 11:16:26 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c2db2ee28so77688255e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Dec 2023 11:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494985; x=1703099785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCozS9Tm/Y8mGnGnquLyOf4tn+xIeETpzkS1V8OEWrI=;
        b=yGBKuJG/Eps5Wy73qoqmQf6kfFM3qtn1126xeleyAjySALuQKQhoJTcB/PmOPo5Mn/
         Nw/kZqdfVYKrVP0cVHbkqP65Gyw8ru7Uc2NlCWvtg4q7Eu6k5yQxUQ2BFxwkfTJwEt1Q
         NlmT7yIR+cNV39Yn3Kv5F5HvdhLMW8T8tHp/SlIq0UWROgGB15SjC72/RbCj1uzniYSr
         vF4wZ4cXfSjURqPURP2q9zfEj60ZcYstQGh81Sihe34TAZWKtvqZouHI4B5DoII5P+VP
         6QfWXPqgtLnYH7DecPIL756pwd+SAu12PsQJlkve9JnNmPbTLFCSa7PyXtSf5i/uupFM
         YaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494985; x=1703099785;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCozS9Tm/Y8mGnGnquLyOf4tn+xIeETpzkS1V8OEWrI=;
        b=rBj6yP09zegyUPAvY9qPnLWtE+PLMcx1F6ZH8TOPg0UnRZdjMvbj9uww6I/X7UwjGz
         qJQq7NGDRMElUFt9UITftC4qSROUVd2HD2WkQUPui1tez8O0zWsIjXEc70FnS2x50kxA
         6I8yeDlow/XsbmcdSS8mh4//S/QpM65IwZiMFTLxFEbhBvCCGWNinC+ghvLtX+rg8OCd
         ygiRezJC5kCYAmXYgfPf7v2E6n7k+r+mnMkl+tEgJRA9MytbgtsbBRZ+ymyOw5djAAVg
         1mLwvgiDiVGoWSCsMj+KStM6w3rR2aFx8GOvRZn7PXGjEtlQEHH2ose9bEPOeuoBC+AH
         OUbw==
X-Gm-Message-State: AOJu0Yyz/wxcMyzZ9BuRi09D/i+7yNnAfYMt4ISd8R45q3caSL3k+MEA
	ZhcvkFOpV6cKRX0Crif0lv2qKg==
X-Google-Smtp-Source: AGHT+IG74hq6EJrwdxeiFaPlj9yTpc587I2CsuoYOiT+2xrmbHNoJdVw30J42Tdk7L0P36ombllYEg==
X-Received: by 2002:a05:600c:474c:b0:40c:4575:2050 with SMTP id w12-20020a05600c474c00b0040c45752050mr3504020wmo.96.1702494985203;
        Wed, 13 Dec 2023 11:16:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm20190085wmo.16.2023.12.13.11.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:16:24 -0800 (PST)
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
In-Reply-To: <20231211162331.435900-13-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-13-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v7 12/16] watchdog: s3c2410_wdt: Add support
 for Google gs101 SoC
Message-Id: <170249498306.308886.7093117515363733145.b4-ty@linaro.org>
Date: Wed, 13 Dec 2023 20:16:23 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 11 Dec 2023 16:23:27 +0000, Peter Griffin wrote:
> This patch adds the compatibles and drvdata for the Google
> gs101 SoC found in Pixel 6, Pixel 6a & Pixel 6 pro phones.
> 
> Similar to Exynos850 it has two watchdog instances, one for
> each cluster and has some control bits in PMU registers.
> 
> gs101 also has the dbgack_mask bit in wtcon register, so
> we also enable QUIRK_HAS_DBGACK_BIT.
> 
> [...]

Applied, thanks!

[12/16] watchdog: s3c2410_wdt: Add support for Google gs101 SoC
        https://git.kernel.org/krzk/linux/c/796bb2d3a16c1e786ed51183162783405b5c8f85

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


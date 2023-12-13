Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sAb05010"
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08DBCF
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Dec 2023 11:16:33 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c9f8faf57bso93784191fa.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Dec 2023 11:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494992; x=1703099792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fxr+fjlAkMW1BoUJOkEvhkSbaf/iRruRVLO4t551dxY=;
        b=sAb05010NwRzNJQLWeUpuaZTGB0Nao9mmLkWQm3J1nuMoCjuvqnwv0WAl7ArwAHRa8
         1t0JoPLk0w4GISQR8aPNl7LhYbSaQOCtcEFB9oci7jI25uh0SHVKQLOf3zmao1oM1cYX
         UVjcl2xZUgA9cHiI6Sm9RC86ajvsPDxnjWnVIuAcMsnnSlU9AVGk9RvbHBga+tZBDjxC
         MNhbrRFZe+fLLzBsWt/pEBHlgF2NtuSad3JQQXkreFCfXy3Pi6XmsY0mQNh419nbcJg/
         bikk3V3Ug4KvxnTrciOe0xTfc3Y4kKBW7hvh/Z06lvw6kqUJ8Bpff+xbIfD14iI9lfkQ
         E/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494992; x=1703099792;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fxr+fjlAkMW1BoUJOkEvhkSbaf/iRruRVLO4t551dxY=;
        b=xAW2LtYHdh9HhhxTW7JPOznPj0Ns2QWJzIVXAsGwJjA/6Okwdwt2zOthLWHHTWnc6r
         yRqDeb7ZVFCVU7KN4nadHy50IOgXfEtPPT0G1Fyov1wZYg/8prXKMp67+JaPYoaiIhiR
         e/pQRfvA/GN1xIuVBuX4bOdaIBloBezkbT/rjcNWtb51drRtbpOtdK9Y8j9komX6VBgV
         NdKKjUWL+e77g+KNKvpPvWaHzKvGuyAl89TJgWehMp/N38nMWIeSBnwTTWPDBl0rTy9w
         Bqd3beMsDje2n56Kpr4rfxI13dJoRuGCMQo45RO4CEGI/GplkHyujrDCilBl+ATCUSnW
         PwSg==
X-Gm-Message-State: AOJu0YwZuPPhACuuPSdr69SO5FsSSW8EfHS4HWy5eSKz+kKe2CcAGYST
	kbdTTI9vsQYacyJkAgBcHgsyeA==
X-Google-Smtp-Source: AGHT+IH7A7P8cAat4Pmc2C5Ik3HbVVkGH1myXeoFgv50CExTJyQx5Ka2M3v3P34rdn6oHqbjrqU7Rw==
X-Received: by 2002:a2e:8447:0:b0:2c9:f68f:541f with SMTP id u7-20020a2e8447000000b002c9f68f541fmr3880477ljh.10.1702494992083;
        Wed, 13 Dec 2023 11:16:32 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm20190085wmo.16.2023.12.13.11.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:16:31 -0800 (PST)
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
In-Reply-To: <20231211162331.435900-17-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-17-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v7 16/16] MAINTAINERS: add entry for Google
 Tensor SoC
Message-Id: <170249498967.308886.12609033691141279701.b4-ty@linaro.org>
Date: Wed, 13 Dec 2023 20:16:29 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 11 Dec 2023 16:23:31 +0000, Peter Griffin wrote:
> Add maintainers entry for the Google tensor SoC based
> platforms.
> 
> 

Applied, thanks!

[16/16] MAINTAINERS: add entry for Google Tensor SoC
        https://git.kernel.org/krzk/linux/c/9d71df3e6eb773f23d6f1f3f8790bae6aba1a088

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


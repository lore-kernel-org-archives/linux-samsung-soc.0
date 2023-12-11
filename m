Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7hsf3AN"
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D897FD
	for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 23:42:16 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ca2573d132so51191771fa.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 23:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702280534; x=1702885334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUHFpmWZqhcKOg/uv3kTOlXRnNTjkbhRIshNDjAuCao=;
        b=P7hsf3ANiat7QC1Yn+CnDjPKpqBBS16NhRNyMgxxZo4KQk+rgb1E3ujgfn2vtkBIpR
         oSqLcBqcNSfYRiTSOinqy6d6Eaaytwoq/lm7Pwae1nb8/GHCyhshI+eseUFxVVUhfk53
         XA4QvSZNEGlO+ctNm/hBS0CXyRhdsW3F/770qegKX+4PYcDY+m0+qEpXY7ej1qTiNzcM
         xdtvYEKz0tivK6tgHRXtK1/gDwQXJuDrcGXKBAM+L8rKfS+gLxhgiaJIZR7x7VQYNVFn
         yZLjjHNwxzo7HFfmM8GotkG5k8YjHl4hATBAQd7QiMkcgf7ckbiPqRvZJXsRnj1Vfb9/
         N/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702280534; x=1702885334;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUHFpmWZqhcKOg/uv3kTOlXRnNTjkbhRIshNDjAuCao=;
        b=LNolJC3+NNRKdMVf547to+o2gQ8OLV3+YV/m8DofQkV2VynzZUxphyCDDk6fYqVoQa
         m0vk7EMFBBAFppsN3osODrQH94QQNFI2q8g388TLeh9XhXth4B6rojgiv0iDYjpixFHp
         s6YvBsOs6zeHx8LZGSIQbyKL0V01lO4Az4+4wd3UgbvaiFJRt3QAIOUmR9uAYUHHND6c
         1rE16YCXxTkUB5wseP/6QoRM6ePLnzXfXPebEO9maMZc5vxXh7doDF7JCXsPOl0tu780
         syqV84GnFypzDT931eabjVLiaHty9flbOkvTSaUmh+m23vRS02ybcMTnc93CbCKiBTSp
         FLPw==
X-Gm-Message-State: AOJu0YzPVKjBhL7WkU6HuVe3NNmCp1iWUny67vMFGGnkmfhtUVryS18J
	whPBaGx3ynhCwIl+RMHCHMP6OA==
X-Google-Smtp-Source: AGHT+IHjjiReYc+IayZnj+luHk8nr7NUsr8MtWRWMkSPYPwtcWJqulRHvFUHM9iJy33hIzVfFlgBgA==
X-Received: by 2002:a05:651c:2112:b0:2cb:2c27:57d9 with SMTP id a18-20020a05651c211200b002cb2c2757d9mr1349578ljq.16.1702280534712;
        Sun, 10 Dec 2023 23:42:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id s30-20020a05651c201e00b002ca0217f327sm1116269ljo.65.2023.12.10.23.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 23:42:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231210134834.43943-1-krzysztof.kozlowski@linaro.org>
References: <20231210134834.43943-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: samsung: exynos-sysreg: combine
 exynosautov920 with other enum
Message-Id: <170228053300.12030.5356013143015298752.b4-ty@linaro.org>
Date: Mon, 11 Dec 2023 08:42:13 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Sun, 10 Dec 2023 14:48:34 +0100, Krzysztof Kozlowski wrote:
> No need to create a new enum every time we bring-up new SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: samsung: exynos-sysreg: combine exynosautov920 with other enum
      https://git.kernel.org/krzk/linux/c/e4f027756dff6a4e2abc640f276f91219559a3c9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


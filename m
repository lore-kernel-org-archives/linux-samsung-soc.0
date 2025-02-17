Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E4018DB1C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788608; cv=none; b=nnIjy75UxcxaPQVGmUmf/ljxPGgyGB1sXi8SHzSYJBjt8JYrCmBxk1V+ZopYiDi2oje6i/ptki/Vjo4Qanb09Y+t5xJmM62mN2KIbw/qGJPXeWKlUxzwY70qG2HpLGwi5kjuNZIJgPsv11b9F6MvVkSIWfZP2GxB4ZMF4T+/clw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788608; c=relaxed/simple;
	bh=HnkP/kpNRRh3mtnxaRpe1uO4+q+YSsKHfwC2hyaD4NY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eNsMXG2cWj5v0ux5JJtED18cD54auaSMnn6ZPMIg4WHZcIGzzsPseVqCjHe1eHnn+M398ewTGpm+OEDK/Bs70OtgWvGMuHk+H+axIVYf+s5t8580D9lTTXtZMtzpYAwjrVKsIf7qUYoR85/I88OSvhGHrT1aNqH5YkBWgazr43s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mz1MrXcL; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mz1MrXcL"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e02e77ea3cso274185a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 02:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739788604; x=1740393404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/PEWwDl9MB7g9G1AMh/oGEgtW4u5T+aVOkhOdQ40XU=;
        b=Mz1MrXcLPjiPCNcIYWdn/LvHvX/2Y+rNc9XD6k+xc29gLNdnU9hmpqLZPaDQ8QXpvI
         ITdW1tj06LuO+hVBWO6Eb6L1F7kFEJVqY+KXBNv3M3hCBAy7C8XDe+d5dQFlVSTDGQC+
         P85q4IjM0XYwlwfrMDAthc0k3Qyn5lfiJ2eUajLGttzAf5es5Hg8sXUEWiAntpp8hYbg
         7PTN8xSAV2nQQCQWpFz2RKeWqVn856m68tFDwlRtjmhqvwDXJ6WlI3c2YU/dnVabKJPz
         1wjbh3Y8+VRz7viP+1x5oW4az7TTc/CVrloRnPyVymkDlbv4TNs0xJ0NmLXZdqaFZecB
         rCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788604; x=1740393404;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/PEWwDl9MB7g9G1AMh/oGEgtW4u5T+aVOkhOdQ40XU=;
        b=n4ffQh9VnDtRkjoctmwYq0NAhVku3nW63x5uyKf7FnnfabAXBQh4ztOSvz2jg44TXx
         PlghwaPgcaoTOZiIWCQRVkwqNe7eDP7jJI3QZ99lPPt95yLV1gDaEaXO77mATP9yWUzO
         e90ty+DWEoNZHuLjWan4IuxqJwqvXmAK1ZG2MxFYWCiQjlD9u6nZYOSGbaRR4RbA2Aq3
         VLeV60MqbnloeIJKH2pQqnttb2tUA0wVLlr0yd7lGRpVtV/BUD0eeT8WLIAeCni6cOfh
         7B4DHGYwJLdjG5guGe5MCLetGSnP6CGG18q6H5bMGsi641iJ/PItw/olhYkFHJVGOHHb
         3REw==
X-Forwarded-Encrypted: i=1; AJvYcCW3vyMe8AbmwYKJNqyrxX8NUAmVr1yRxLN9ephkFbX6Y5kMX5z9baMfua4ZAJoolkB8yIc4j0QDF9u9+6pOWu8MOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw0aCSDiwZXbZ7Luk3wOaE6mK/JW1kB8hBs4s17/DXAIsax+1T
	MCz3JOKlAlVIg8EIOCDwB7v0BZ7rm5PD7sM891ybUzQKnepaVqbDlJvtJWnVQc8=
X-Gm-Gg: ASbGnctRoOpLyvIDkv5ykT6nWxm1xZ1wlMq/uP2sMM1vPO1e+/mLbMNP6gqNdKpgRhE
	glA7ehiUrcijdUD+hfh7PjkhCoMnUuwiFY5zzO+jyUA+040t+4YmKxgQOOcZnKkZEETZ6TzP60o
	htIZRDG5B1iYIAUGEP0RCK5+JGXDRqEETUJg86ymo6w4QrkhaDVxea+ZW8iha/N7d4tW/3geVmI
	ukofeMB6V/uvuGJMqjHZ9XEcOaa4hfTzFJWr7dQWkcs0gEjHLm0uAGG9yz4ZN9OZ5FmR93pGupg
	+o+dlfMJJL3XDMSHpj07bVfFVMczZz4=
X-Google-Smtp-Source: AGHT+IGmMJF4ViTaqLqJAPAEqki9C4gvYmwTm6OvO86oLDWZLtgcjDXJ1cUh7+WEg2+muDpD9D2hyg==
X-Received: by 2002:a17:907:94d6:b0:ab7:c28f:de59 with SMTP id a640c23a62f3a-abb70e5eca0mr311989366b.13.1739788603832;
        Mon, 17 Feb 2025 02:36:43 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb961594absm230383566b.111.2025.02.17.02.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:36:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: alim.akhtar@samsung.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Devang Tailor <dev.tailor@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 faraz.ata@samsung.com
In-Reply-To: <20250108055012.1938530-1-dev.tailor@samsung.com>
References: <CGME20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344@epcas5p3.samsung.com>
 <20250108055012.1938530-1-dev.tailor@samsung.com>
Subject: Re: [PATCH v2] arm64: dts: add cpu cache information to
 ExynosAuto-v920
Message-Id: <173978860144.144850.3570517854379450471.b4-ty@linaro.org>
Date: Mon, 17 Feb 2025 11:36:41 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 08 Jan 2025 11:20:12 +0530, Devang Tailor wrote:
> Add CPU caches information to its dt nodes so that the same is
> available to userspace via sysfs. This SoC has 64/64 KB I/D cache and
> 256KB of L2 cache for each core, 2 MB of shared L3 cache for each quad
> cpu cluster and 1 MB of shared L3 cache for the dual cpu cluster.
> 
> 

Applied, thanks!

[1/1] arm64: dts: add cpu cache information to ExynosAuto-v920
      https://git.kernel.org/krzk/linux/c/bbfc70ca7fd26ee3e7eb16872cf7b1f1be5907e3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


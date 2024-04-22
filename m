Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A36251037
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2024 07:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713770427; cv=none; b=IoyuR6RQGHO57LDT9XC1WvwEQ1kO+qEJC7uv66UbD9UMvyVnOu7mWekoS3Pl6G/QFc51npPh7Rwmw1OrTMvI3+kNDu20AcVt+ajRL3hWVIDieOKaAG4Nl2ZZQBdD3J6FXcFSNGoaUmZpsv7acVlKYsA2kdj5fh2iHNce3WebC6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713770427; c=relaxed/simple;
	bh=ATftZ9Ym7rSAUoJHd1ARgykQ/AWlPFdo0bDfzdin4dQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rSzfAoyToe40BuX/09HmjWEpjbXfvxo0XOnrax2Jg/o/LKI7L0IEdsJYzh6Hvk1EKiv7AC1RM3b2L9wv8Iz1ESdzRZPIbm3bXMhMhFebl+SXS2Qq3SJtqpnafcpXVO+77M1tJBYo/T88yeT4sz7RJhn0HUDJQRmy1pBPNz/1V9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MPf1+btW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MPf1+btW"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516d6c1e238so5130548e87.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2024 00:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713770424; x=1714375224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32Lq/HZzWg4ZCGDLhtubfrCq19J1a57yr3c9tUQ33v8=;
        b=MPf1+btW/Bof0PFz962IeC1GNjlllsUtqaP3KkiwUC9wNAXXI+IuGaatf743KqeHS7
         9VO3QSTSab7mADC52mDkXiXPyfJlz3vhrTOGDoCkJnMia1f0SM+xmrFoXoDe6vKfbYpG
         dk7kyLC/mr3lbxTh47q5aqlUrRHxOrt8ZHYWeZqu3q//4tdnD/zxcZGv4DKOmoz4xzzF
         LZ/XbPhcxmBh14CqhzioMmdzkmFAuqjcqAC+LFSuMgHAjOMZpkuokmb98dMOoUWnzRfj
         AZVAenAoVqDuqGgbROzTP3kXYk5/zlyQ8+4FKHi8OFi4YtzS6Y79oRRivs3XIGH68Emy
         4yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713770424; x=1714375224;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32Lq/HZzWg4ZCGDLhtubfrCq19J1a57yr3c9tUQ33v8=;
        b=f3TchCQZY9pXtNWO2DcGabFTA9EObw+OBUhUQaFKUWlJk8nwSxxIKAefFmO6tPlm88
         09pkWtq71hrsSAP6I4amwMBd3s4L7Cq2S90h3SNLiWDQE8YVs++D0/qUYmsAmTvHrGJJ
         cRjGTKIa2Hzc2mXdk6qAyp1kZmXKfDjeAiDMROR7ScK9vYbfVJpH6ElGgh+COlQKmSAb
         Tfv1aU+NE+79jE2x6K72uJqezU0S6JgJzRVvgwAHbj9z71mFjRcBNJAT1hl96jVqwtUK
         +OxSeVEWYOLpncfTzHEgBSZTzYOJgAq9W863B7CpcWdlBiJLq5euLYYMhC9aUPJkUFe3
         dTMA==
X-Forwarded-Encrypted: i=1; AJvYcCUmoYZRyTDsfUeF9AwKFMNFZbQZtEU/8G5SMGGTqbJ7V5yTyUkkTjz2pnIgu8kNARp/oVoCIxpWMkow/Qcfe5qVoLB/u/2BIvD3hlsa9BZDMfg=
X-Gm-Message-State: AOJu0YxYlUbvqRhqwgosF4wa8xX86e3aws0PrYGBiPgKmpC5VpVIfmsf
	DrD20Lsghh0siGXSsd+9pFlKkyTGW7kHS3Ry0gOZYgBRaoVfyUzhkDcJPFK8VtQ=
X-Google-Smtp-Source: AGHT+IE0GxCmo2sauSNNM1yFpkUOibF0cGEOXefwlVpQiyWuzx9DvXPhQthTU9pfqLtasIWX7K48yA==
X-Received: by 2002:a05:6512:b10:b0:51b:2909:4cc4 with SMTP id w16-20020a0565120b1000b0051b29094cc4mr2054973lfu.46.1713770423518;
        Mon, 22 Apr 2024 00:20:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id s3-20020a056402164300b00562d908daf4sm5205872edx.84.2024.04.22.00.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 00:20:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, semen.protsenko@linaro.org, 
 andre.draszik@linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, willmcvicker@google.com, 
 kernel-team@android.com
In-Reply-To: <20240419100915.2168573-1-tudor.ambarus@linaro.org>
References: <20240419100915.2168573-1-tudor.ambarus@linaro.org>
Subject: Re: [PATCH v4 0/2] clk: samsung: introduce nMUX to reparent MUX
 clocks
Message-Id: <171377042206.10231.3797208490823201633.b4-ty@linaro.org>
Date: Mon, 22 Apr 2024 09:20:22 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 19 Apr 2024 10:09:13 +0000, Tudor Ambarus wrote:
> v4:
> - squash nMUX patch with the PERIC0 patch so that it becomes a single
>   entity fixing the introduction of the PERIC0 clocks. PERIC1 fix comes
>   after, as the PERIC1 clocks were introduced after PERIC0.
> - fix the fixes tag of the PERIC1 patch.
> 
> v3:
> - update first patch:
>   - remove __nMUX() as it duplicated __MUX() with an exception on flags.
>   - update commit message
>   - update comment and say that nMUX() shall be used where MUX reparenting
>     on clock rate chage is allowed
> - collect R-b, A-b tags
> 
> [...]

Applied, thanks!

[1/2] clk: samsung: gs101: propagate PERIC0 USI SPI clock rate
      https://git.kernel.org/krzk/linux/c/7b54d9113cd4923432c0b2441c5e2663873b4e5b
[2/2] clk: samsung: gs101: propagate PERIC1 USI SPI clock rate
      https://git.kernel.org/krzk/linux/c/7cf0324ba0bc61a8c360d23d284e06d2994b1fef

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


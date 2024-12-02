Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A5529405
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Dec 2024 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733148917; cv=none; b=UtK7HaFefEk23rFQRZx8rWZkgwZCum6IOFXul0UHB2I4GrjAvncdMypLw5Kv4k/qXTL8FLQ798UJ9Dd3HHXDOkNJVwd8lArI0AJKg7p33m50ACCUNgJ1H9AGUPMHYOwZmFEkr0BNt84G6lKsnS2Op3ObuJeyR+lXPuated0CbZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733148917; c=relaxed/simple;
	bh=ErEwmTVW+AJuBhiJwMY/EZuwY/ewg6Ae7ulD+DF5Jgs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OBkoHGBNx91MILJikx4AJs0GdsAjH7M912YEw920reT9WSg3cnlIAn1zti0Fv/WHz5PZPVdGyGSRGTIv4HGe5QGs+bi6Jx6BzgJQspCNL86riQ21UAFfYxOQAvaV4R9NiQDBLjyRd30xmSurx82l9DTFXs8oR6PQ6CRLUPp85zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PPoAYwi+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PPoAYwi+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385d7fe2732so201215f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Dec 2024 06:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733148913; x=1733753713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4WY1vAA0r2fKbPXY4KjAS2UpwZ8hfCdwU02a05Yrls=;
        b=PPoAYwi+eUePvErxy+KYvdLvS98V7Pdj0Cj7hD2p03ikjT1l5VaKmhtRSLQxidsAH0
         j363wx3YAEEe9Pds/nm+sm2uEDFo+FzPq4fkq353hzlq3EARaYlXcgXYFcCe3jdiUa9w
         Py+YhpNbogB4b5kUIyiKSil59OBIFu9HBJpdTrNSkqMPiy4h/kzIMbhzkWKYfZhJ2xOM
         We/m7V6fxnK1sxEBpdxNmwLw/v+c1rUsE8ZgLuu8qLAyLXx57nNAD3nyphenx9sxLpW4
         us395mC+EMtg9PXwf+swibPW0283mwuvxy0QiyZ0VjBFN1GHmzasKqjySe9alD4QfGS8
         pqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733148913; x=1733753713;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4WY1vAA0r2fKbPXY4KjAS2UpwZ8hfCdwU02a05Yrls=;
        b=IXn5g8j2Kcd2hIg7HWLSpiscc9iLaBDN05kgUX66LR+QTqaZoj4aQEU2mhiPBnFe12
         rDwL4DTmlfPiYbiwCwU8d6Q/Pc2ijOW0p/QQA39FS0AdIAOLeqqqH1F3u3GVDHUJCczy
         PX338YbjkyjUOJJvf9yoUMiuG760F+6YjsuV+9S3R0d8tL+0dNDxpSNFbVSgkCI8QJw5
         bXjbJMHqosb8/i3J0MSaR/qaYKCxh6u67CBWeRf8p2qgZY2vXd5M/ZbsZxP0QrlWjjow
         qnmeev3MBO3zCRQWZiJeafTxrI0s2mXH8iFVwIeeO5cZMPpiigCI9JFkNjx7Jro0ORYt
         +H/g==
X-Forwarded-Encrypted: i=1; AJvYcCU4WGW4xlKTslTxPw4R3tgnZv7MTUi3d9/E027ccpSLtqIMc2nygmU1CssDW21iLGqyikzGty6oWIDLaxEYBM1T2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbuJeBa9y0eCKuPBsnMIXmptxfsdPFVNEFqX/x+QoiPiyG76ln
	s6znNk6i1PaO13tWf3wjeA3llVUpw9lV+A9Qak5PrUyXaSdOuRhHOSmJogBOIxY=
X-Gm-Gg: ASbGnct8XnuUQktyJG0cpbmze0goCNqjUZSM2bKeg7jVeOWnBDSZxpwCzY+J4UZdkYs
	cHEl1d7fR3JOZdw10XzTuP0qUlT6GbPQfP6917EzLrsk/M1je+o0jy5mvGA4gfPnuReBVI/dYHj
	28B0XvDcUbhC5yDPnAVoCpebVfFLLBDGby1upkrjrx/ODzkTe1CkAnyUyD3fLKxRxUjaaWAVvcB
	0cn4/cUeoiVlV4nxurDpjq5RW664/IzAf23tPTorVBZh3pWpaEzZDaWPCt3ertq
X-Google-Smtp-Source: AGHT+IFElDO2xd8mFJCzbrH8EiF3i2wyF8UmcXsrEdAyTq41fa6hejn4lGjAijspgIkC6zPVj6Q6lw==
X-Received: by 2002:a5d:5984:0:b0:385:de67:229e with SMTP id ffacd0b85a97d-385de672523mr4078648f8f.11.1733148912772;
        Mon, 02 Dec 2024 06:15:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dbe4ccsm152388855e9.13.2024.12.02.06.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:15:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <t.figa@samsung.com>, 
 Thomas Abraham <thomas.abraham@linaro.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
References: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: samsung: fix fwnode refcount cleanup in
 error path and update comment
Message-Id: <173314891106.48956.4220732642073324618.b4-ty@linaro.org>
Date: Mon, 02 Dec 2024 15:15:11 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 06 Nov 2024 23:04:38 +0100, Javier Carrasco wrote:
> The first patch completes a previous fix where one error path stayed as
> a direct return after the child nodes were acquired, and the second,
> completely trivial, updates the function name used in the comment to
> indicate where the references are released.
> 
> 

Applied, thanks!

[1/2] pinctrl: samsung: fix fwnode refcount cleanup if platform_get_irq_optional() fails
      https://git.kernel.org/pinctrl/samsung/c/459915f55509f4bfd6076daa1428e28490ddee3b
[2/2] pinctrl: samsung: update child reference drop comment
      https://git.kernel.org/pinctrl/samsung/c/0ebb1e9e1b12ddcb86105a14b59ccbed76b6ce00

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


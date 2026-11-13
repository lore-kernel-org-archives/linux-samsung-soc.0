Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794569167;
	b=Bow0NHkfSJiKR3T0XGwBOBNkUYZU6XLu58sK1dveaA7C1cI1iIE4gPHv1QVNjhoIsXAv
	 JRfS49H9D8+IFUJXVwvjYDrRFvP4zHsFHgmrAKYQOTpWmYM90g9BTYKe+kDzYsv5UNo73
	 hgoXARh0Z6iwkwTcSI+nt/tyfh0Sq/8LR4AplKuDnSlUrpXhG4WUaO9LMBHunVLEO6uzx
	 R24bWoNgmZeCKtHCpTFkEG+ON2/wOL37RMGKxNdyFwlWBGYkupdwlx/l/YTFDWCaIRd2/
	 YMu5dy7yV6cs6eQhhPI9QdPVNueRcbRLRxKHl4tkjg6akMX/ifW9Hvg6OUdajCWyTfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
	b=p+JvHXHU6HjvF2RbtFxxY2FaMfjUuns8w2gArBfEx1ux/Fss7ccNDPRy+wg7WHC+OYse
	 HxnWnoT1GHK12sXJnmYrZKhnuA+5m9BatLFBkkyYYhJ8XmFKvoFdIguSX6bddX8Ws5wKZ
	 DZLVLPz7vhTt81QaQ3MEcE4L3JJqHAp24SVuS/SdhSZ7o4+NRY3b9bnLJNgEwC8Vw5ADM
	 bLJXf3WOzXCSCm4YPZzpDony4cO+dWjn5H76Qm3u26VP+oTSTCxqlk/CGe4JZrH0FUpIr
	 6g4E7Qf0N9W9RwsrA5cr2BnfdfIjPH9M+R6Twv2lCbbPDEszJ+FKpLHHDx+ZrQkTQkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dEek9Htp;
	arc=fail smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F9A606A323
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 11:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F9A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dEek9Htp
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4322d310e7so215482766b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 03:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794569166; cv=none;
        d=google.com; s=arc-20260327;
        b=igOeXP2jNJxEu94iOX/whhEhkqwuNmQMt83Ay4DoDB8ZFHMPdtY3SUYVgaUMR+w24H
         IGV5tRpQBRL0z16R6yOMpERRwfcPOVbXSW/4BqnLtVNzoJglGHbUiWsf/IyhI9GX3yZM
         wZobdVjUU44r6HKvLqLfXOH5Takn1rNNZQN1uOTVanZC47S7QzrAF3vVY77+zumzTeFR
         XfQ0SejYKS5qgiVYFW7HgDR9uXdZc5otlxYFkfkx+U0gXPIiTEnRBeV5GqdUWUeBlx9+
         SdpfKJSW/2nvpUKVdRAIntIzlDQoPA9ja1lWcJCYTGPYy96UWr06qBa9mxcMtqrerM1o
         PyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        fh=OruhYX0oWuFmSi+T1hsJjjdzwLJyNyTffiJ++Ub+keQ=;
        b=OXmJ1pcXBz6UttwyuVBNEyyTloGYKnFcQeFkm4pHrIaZPlcRMGgSAZ1xIE8QAKdAH8
         zq431QMgreSpGjuEAtR6fj00umxTnSprVM3RcugA6jCiabIcDHtA1IDMxZbU++wJvsoj
         EpYdx7B7lBafq29aheIoRcp1zV7d3bZ4z5mY3jTuwY9ub6T/ALXaIVS9fUydSpBO6WFy
         QARs/vCHeL5RRgE5Ac+RcNgwdEhJL5YPFC757Z7V9ojhrqfyqDtLQNq5XUX5fVzxXe+6
         MViq0gIhT784I+CMZXU7bCujKcmIv5n3Eh/UIjFS0zXv2rA0rc+MuL8XCBv2H5npgDrh
         Y0og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794569166; x=1795173966; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        b=dEek9Htp2rFd6uu2Ph7g8AxNoYqFVLHVX2mYLl9kLY+HH06kTBXQOKi3r22Mzs9smM
         sagi7bl3+DQo9QkgTX7pFHO93lrrwfHA6SuB0Jwny1Vd/GzwHFiBiOLy6S9zwJfvMoMV
         BKXLBxVHAmkpbgA8o0UpnP/AfJIu1vZfb6RN6XB4+9f2VpfiBaFeZ3JlErhNyKX25LeG
         eXs4P2pgPEqHHlNwFOzF9ojZ32WC+7RCdT30YKCLdKmAlot8Hrf4HxUhjgtdo+bcdj5R
         UjplazmJUwmFyYVBT23xLFvylNJ7TA+SVSzh4P6gk312G6Dekfj7exzocUaakVK7/BPK
         ABFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569166; x=1795173966;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        b=LjMMTuUPhFDnlvqoPKMFlATukp/1ojVX2fmrarFnSH+ahVk53wXbPITcobGfU6snVj
         qXK2QUsO35CDlIbjJ246gUq7BYQf77WMU6N0pUkF0k16uARy4zEQOCNH1E0N4H9evXuY
         HuyfDBBEEzvVN/z0V932RIFiQI/oDsal0R6atsaCum5Hti+aDj2HEECo+s8w5FnqEkKU
         RU2jG4+shouDY9Gqor8RMP9nySo5cMRMJUT1cUP3NC3947a6SpaReN9c2izFwPxqoI9F
         TAv5q1Q11w3dKyaBOKplf/m/On8kvGaFu66GIDrmwqX7SaBumWIrvLTTaj7njHFH+4Ow
         Ekmw==
X-Forwarded-Encrypted: i=1; AL+hErF791qugvLzbveUEFTipKCoa2sh+ZAwaHE9pSF3+r5jIe+SiBpA9d9GIseB9GZmx2GJk99JHRXakzxeeB+zEzz8Hw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8n2A9VwVtdHwtcTlIMVWLb80K9frVrPnY9DL8LZoZ3aMetmJv3
	VsJwvrs8vNmWlun/0u71Wt7fpNc2vYTaXvQJ+NoDL03jkGeH2EZBQgn40zUM6TP6WFesIyYF+Gc
	0G2qeL+P4g4J+fQ2bc/qSrK6uTMp5H/4vSUs7CXdhJes1/ztZOO10WuQ=
X-Gm-Gg: AYBFou1uJ7DUUD9N3nqMdFF3qsdOfN+FG7U6k7YWYNvW0DNiMNB8rrXPnb0Ee5YB6GQ
	TvXED+vzeNXaOqDy7mOquWRWN5H4f9SNR1FGr4ROx2w4pj2AJzRo1d1rSG9PtLovKbVZiAe6cAh
	MrOhOS2/grXLPZzNaOkoCDw3AiU8b/p+W1cuEU18GLEhF4fQ8OA7VKyw9wgJ47CuG/CIIRTzZ4D
	bXVyedi32Lqb0gqQQx/zGuY9xKv8F2YHEq2fkqTVZGwhXfKzK72LYOaSR94Aw7UsQpi10Al9qr+
	5xmpftEzpO2h5rmI0FrQtqZFg7U/0ZwbsmZnVDc3dcHsXsFfWLcq9iR9ViTTdFx+X2tpdsvUWV8
	3G9mslYKQC6PU7b3B4UJHBhX+pKi9RkwQfXwxe9/1zrkEUThjoWnN+bDct3B9yg/4ovx45g==
X-Received: by 2002:a17:906:c154:b0:c43:bf29:1517 with SMTP id
 a640c23a62f3a-c50962edf20mr170802566b.12.1794569165639; Fri, 13 Nov 2026
 03:26:05 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104838epcas5p2623c7a05b6163954e13e98367063e7d4@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <937773018.41794567482875.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <937773018.41794567482875.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:25:54 +0000
X-Gm-Features: AclHuK-RupDt9op7f4Ges1DbDNx958GvAIMpdcpygcG5RXJOoAuuhRLl1DXJwcA
Message-ID: <CADrjBPqfJTRpsgJza23dup5sB9OxhS+AJ_vzmNtmuuJXQaxOxw@mail.gmail.com>
Subject: Re: [PATCH v3 03/14 RESEND] dt-bindings: clock: exynos8855: add peris
 clock definitions
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:58, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add device tree clock binding definitions for CMU_PERIS
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

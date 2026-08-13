Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EC6381EA1
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Aug 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618405; cv=none; b=QW00ETek1Xj6dVVj4MdxPsv/24Uc011DIhAHMvczVe3Mr0Jqpbx0/feCq1lM4JfPs4cJO7EtrH5ir/qmRy2rypDSAb/lMy2O5C/ExJ3WkSUVg4lqhfJ6Qo2krOEElch6sysFQeD5m4mjOh/f1zJikqpdtub1ASTo/Liio3uN0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618405; c=relaxed/simple;
	bh=+xQTI3Vq8sC9x2ATvB7YIuXwWhZNhSgMb5gkauWI9KY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=qZyErzaA0UNxl5Kw0pVRFgCdNv7CORLfVJAgzMnFH8yR1zunBuU2tA9x6jfNMsiOxNVlUFeXACzBlNQSe9fTKwU0CLCgVKMwcuFyWVVgJjK4Ns35cPOEUHlYYW8HlqzKEvizDa/5WV/+oTAz4Qk+hTb+Jxu5Fa3rxH+JwhicSmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xNy36p+M; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xNy36p+M"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2055573c8cso80845366b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Aug 2026 03:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786618390; x=1787223190; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+xQTI3Vq8sC9x2ATvB7YIuXwWhZNhSgMb5gkauWI9KY=;
        b=xNy36p+MlrjIJzQ40f9dBfcVY+oUmxOWoApXwHNT22jF4A0GGMLQ52d42JVPwut33C
         fyufVnjjzISn6iRuERTD0k5F2mLlFzWvrfO/1qzyKVMEA9nG/Gt2Jp0S82CdU25+awE9
         i0bEzwFRl72D23oaDxjvFQB27hYG/FOoQ/rY/VRRCBdduKS2sO3a8b9Zgh9YSsVH4Oys
         XdorA3+qWvmtartqryORMcTTuwNu3WsCDU+CrUefar/U5FMupiAREfcuf5MKXBpu8By6
         VCMO5mDgW1qq8PYy8QdAd78swJVvZckhtI6a7KwCrhej9+0fqx5+hGEbJhzQY0ndHreN
         LkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786618390; x=1787223190;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xQTI3Vq8sC9x2ATvB7YIuXwWhZNhSgMb5gkauWI9KY=;
        b=jbqXcLLTIvBEH0II9cvHbB3DAk+8094gGCIYuMIRd2MMEw2Ai8yxU9ibFQLlrSOTvs
         akd1xssvsfwEZMQttASZi2fwkgIABoi58N8u2k12lLof6gsG/8eIYRux12/pvdkvNivM
         0sVOJ0AcB5VTcy/9398aVXIMQRX8AIDvkl9vshBoZNgikzAzv6lzRvqnOVuxdbrcR1jP
         JYPFIdya0dVxZrCbzWyzmLguizvkDeUxIUzq0KuWMBcSSMvejyxorQqXXs4eZOv8ObPh
         A3F1FFvDc6gONy/wKItoU1Z8ZlGAjtoMY23dIRJmyFOAuepimFmwJ5OQQlrz7TjaRVRF
         E9nA==
X-Forwarded-Encrypted: i=1; AHgh+RphDA4IkRJbYQ6CJTnGQm/Fm5Awsp2tAqSkLHMUVmVxkGK2OfkdJXE0ysaNw3rnS4MRkbxFtMGO5PD00fgjtFp+Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf9YXTFYsiP/jEQ2NJh5ZscOrm+EP5zn+MfOMBJ3T8TWftmuct
	POtBetI3GXB9sMT3rRyBIT28loiKtlY49fkOD1Xy0THqHk8o820t5vlIjRnDRByNgIY=
X-Gm-Gg: AR+sD139fFnptR/gd9ZXuKKtEcpWUt1Hq4/BBXc0Qfyn7yCcFIS8GJUjrpw1jWDrFIM
	5nCLv+iWoGjUUOnFc4rs6HM7ymp02AkU+FfFW5ZWIWOLpvMcynxBc1FkRW6MsLjwN6/ofx02hw6
	6wssvQKKFklNICcA6Zylo90Gml8wUaFiG741ZoDaOpbM2z/qlphDYPRUzWSedVgEaRr3P+4364O
	iNG+GwSF/Ft9WeE4uCh/oHLe1Buh4kkHQFT1zVKi2NOe16WBMYZyKS7qITtK36CCN5HEt9pvVky
	LRn99y16gzOULA1DGqPsNeMpNKtSpY2VQpo/QzCuWEdMp/CP1LicGtHqhP1pLcleE+ylpwfNK1g
	b0/RY9PyYSdN3nqyJaDqwxkJKxV4bwF1Sn7EkUdeQS2zHVY5fPfl37eNUiWRyWTb5NAo7Nzw/yy
	54Ykm4cmBflacpaxpVt1R/oh//Y8iDoj5aL4vEEtqeYXm1NTM8Yk07bqhBH5/93UbF5boiaPizM
	cxCZ1cEMKzkf62n/I5QYo8VlALvBndBHJFtSKkCPN88hgPTiQFyXA==
X-Received: by 2002:a17:907:6d0d:b0:c20:fc74:5dc0 with SMTP id a640c23a62f3a-c2109161ec7mr212458366b.32.1786618390352;
        Thu, 13 Aug 2026 03:53:10 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:c11:afa0:9e5d:4eee])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c211aa04446sm620566b.26.2026.08.13.03.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 03:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 11:53:08 +0100
Message-Id: <DKNRD14Y6EKO.XP8CIMGJ4RYK@linaro.org>
To: "Jassi Brar" <jassisinghbrar@gmail.com>
Cc: "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sam Protsenko" <semen.protsenko@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Subject: Re: [PATCH v4 0/2] Exynos850 AP-to-APM mailbox support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>

Hi Jassi,

On Thu Jul 9, 2026 at 3:45 PM BST, Alexey Klimov wrote:
> This patch series introduces support for the AP-to-APM mailbox on the=20
> Exynos850 SoC. This mailbox is required for communicating with the APM=20
> co-processor using ACPM.

Gentle ping. Is there anything else should be updated here or is it good
to go?

Thanks,
Alexey


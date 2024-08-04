Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FCF23759
	for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Aug 2024 09:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722762589; cv=none; b=ftNF0GH/fHRgrz/bClYgPgUrXHZu3UQfkbRJWCxWsCJ78LUrZ5cSMNw9TbWRbIMCFbkH5Gk/kVkky/1zfaArSMS0WlyjDK4ed9hyotkt3gRbFUPXF2eGyAZWlvlbA3f1rynce7jAnofdHYN9yWbJ5u9y7gJJDODiRooXPbluYNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722762589; c=relaxed/simple;
	bh=msD+Pu+Q6D1xBrZhQ7xYLQP5vBlKSa93nvdA9bCO7Jg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l6USHjd4bS0IbA2SOUrKztob5FhWvy/hS8PUfZXaSalnwhGTOsx+2fKcalQTKn+coizA0A8wEKojB9MRLFIS8n2/fdMxWSgzf0jjyMrh6hrmRZpESNTUaDFUrZs+sDDGAgL+b1j0L7eerwPzgmrzpBRKLLR4qpd5vRM1JJ8lwBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qtC3LEO7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qtC3LEO7"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-368380828d6so6458691f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Aug 2024 02:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722762586; x=1723367386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHLoWshexZhuP2J8+WGpm+0qtk9I2Aug6souXmLzt8E=;
        b=qtC3LEO7hADTBlKAjiicGaI85SYvsNPdTej84ruDwA0XRK/iZMDaJqLqDVa56mOWmw
         WjDxlx+LIZOgeS9WhopbUiBOgPApnoYkzXC2fMNAGmo5n+HvkFcYv4+IzzrV6ePaXSGl
         ED71YXCaVfL70QQ+nJDNqAcj+qPmzciGIG3JnfFbehOGaerUC8fxgaa8QUU5juHa6KHk
         1MBYpU6aA08ENWN/p7qlp2kkxWgERxSKVuAF9IF0Odxjk7ddZcHIlOj9HjBrbNMGqPjX
         3jvKgAO3RXOPZPVj6MVLtfaHG0yG6PHKU3P+IugiWjwh88FBZQiyMYJRL95bIu59GPAE
         nT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722762586; x=1723367386;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHLoWshexZhuP2J8+WGpm+0qtk9I2Aug6souXmLzt8E=;
        b=iM720ZmpBDxpRepazhpKZnfOknFfceAGwL7lhnQB0titRetq9mKeTTpg2Vs11AB/r+
         yxxxJK/qQ8MqolWHexrSBnGZ1jqK2NdQ/0gR50aAsVxRlUS4QMjWpobRxJRlVQfoDP6r
         yYoRqfSp5VR4qh6uv/K017qxT6yxO5A2e/op4Gz+1EPFCXHeri6Mr7npYLxK80u3mzUW
         imGMAXO2PeJxCTBsPWFhZFGPfEuWqhcJZRN8zp4vTOjQXxQbOJDc9ileAaFQcSkgIY+k
         UXOJDV5vj2AUoPL1BXCzlnGiZXvvf/fVrHdWIo+hR0X+BaEpY/e2NPANnWlEsr5Fl/ao
         dcRg==
X-Forwarded-Encrypted: i=1; AJvYcCXoxNkDheuLcW7uYgjUCEdl0v78lEn1ovAsD6fUB5BztGH0yNS9KMFW+0yil3et9XWPpYkNU5KcsBvjw13zrzP14TNdMK2dOcEHyNMRQrW9XAI=
X-Gm-Message-State: AOJu0YzfB5wTJbNrStfbuw9SmeAE1JBZDNEw/rLUIPCvS86y0LZgNK5W
	++j5S8774CgMV3VsLMcRRhvdujxxbE5iZhhuyAAh3vVe4B63TJ3/0ctHT8HpI+A=
X-Google-Smtp-Source: AGHT+IHCO1fd/5h1ijS72pP957S/1fryoMWPBggf8fwYHEKJsA9djK2DDYTC7fOb8ySFt7DWWO/kBQ==
X-Received: by 2002:a5d:5c87:0:b0:36b:bd75:ed73 with SMTP id ffacd0b85a97d-36bbd75ef23mr5985987f8f.23.1722762585867;
        Sun, 04 Aug 2024 02:09:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd075100sm6244814f8f.105.2024.08.04.02.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 02:09:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240731191312.1710417-16-robh@kernel.org>
References: <20240731191312.1710417-16-robh@kernel.org>
Subject: Re: [PATCH] pinctrl: samsung: Use of_property_present()
Message-Id: <172276258438.8347.5786673357734721862.b4-ty@linaro.org>
Date: Sun, 04 Aug 2024 11:09:44 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Wed, 31 Jul 2024 13:12:54 -0600, Rob Herring (Arm) wrote:
> Use of_property_present() to test for property presence rather than
> of_find_property(). This is part of a larger effort to remove callers
> of of_find_property() and similar functions. of_find_property() leaks
> the DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
> 
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: Use of_property_present()
      https://git.kernel.org/pinctrl/samsung/c/aa85d45338692e8b29b0c023826c404c3e7113a6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


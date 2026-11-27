Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818740;
	b=Rn+tXPea3JCjKo4I8yv1kselTyUbpTl7Xp9cgJn4EVNtJitv1aMN4p1B5zfkZ73BsakV
	 uRPulnoEwBnlKjb0JPzb2xqQ3o1qGUmLHfqnyI5FukDsZjI6bB58ueJZfxxePkcwNR50h
	 MFQJEk7X1JwEo8pKObyW5bjiDqU90/VSgkzNw7ulCmqovvf3AvQ4/d3ladZUdnbL0ZHWQ
	 le90rsGeGIP2D7QwJzVXfDArQNeiqFLtePOxJM/L90+k+8+mrL+GN9WZLfOtzBp36u2Wx
	 wJ3VXo0iLdb0/qC5iZZNxHtCcq+6z6JtUVn/8+BPj5pDvv3OsojL3QmY8uVbxHT6ycg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0i1G/+YpV4sZoXtvA5HG/1gUD16tCeL0tcOTZF5OSg4=;
	b=pZbLZ9675OC0FvSA9bzunPu/3QcjM7eDQKNeJ/8ZjnU/+Ewa0xSDhElzatdMQDLemcmM
	 xWgBm6xHWfWBG80Em/P6I7yR7DXpBMw3P8lDYHeqDBbbpS9DXrlpzhHXUa3j5JFc4W59g
	 9FhQO76jn96EVzp/S9BxYwxLNhFL/dtrDAs5fccKBN135hon92X66aNC2VcLJPD7RCvZx
	 55rpg5vCwiGrDMNiIXjtKdWbHTCL+N1LdPhdMGVxIf2tAnD1z3I184sg/pUvgDPwzHIEh
	 DG2Amq+XCOlQQlTWkY4HzYcNs0iXSEnBjs1/5uAbJVWOTn1mf/bJG5+hK0uGGeWHjQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AH0UC1Ja;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE36F606A338
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2026 22:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE36F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AH0UC1Ja
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so7716616f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2026 14:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795818738; x=1796423538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0i1G/+YpV4sZoXtvA5HG/1gUD16tCeL0tcOTZF5OSg4=;
        b=AH0UC1JaXTdM1K4oaYPHTi9yx537Mf0QnZ6//35H1UjhlmcoPR+ROTsEPP7PYipi5f
         aEiLTiSntKha77pfMTEnwB5lu8RM5pW56Qg8SmxAluxiW3RVNLBCW1ltI4GYMY/MT+fQ
         vHhOfr26GTL7STS3wJ7FmAKeMelcRh9JWSAZXg3vfBM+shGpPwxxCFGYOvsBQDGF9A5b
         5iOC/RQ3Axju/x4Uh95KF3FIsPX0qwgq6r4Mc8oEWvL0gSDiuvvRzzE20/uzR253uSI/
         SEbSgfNAhmNZPfHEtIjd3Fpd4pxCtGz293JYyVbHhbzcIO03neFYkZCQUm7v6iGUMGdL
         5wXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818738; x=1796423538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0i1G/+YpV4sZoXtvA5HG/1gUD16tCeL0tcOTZF5OSg4=;
        b=zKXf8F4C+kDDcaY00nDbLwRllxEubfujErZdOBdf8ieveLe3mQm534Ec8xyI9wS0O0
         GqaRtT0Cm4q/CbQ1rFqQ+IUikP2mk2Wb7gBxhYGi8Wdv/V+Mdy98QVazlWPvxe+zIa1l
         OzTdsIUEEjK3PQQmt07VMUhNx2pCN/MrDNXCLz2st+zwuUqC/X4e71zrK9zy0/yRpm3C
         ZR6ZagixGbWd7QX+RJglEYQOPb4/coB90iRIo3KQ3L/DvSq7V6CeCkV4N8dOmPDWD+By
         lEDpki8N3kILQlqgK331Cxnvwezni5QS8UU7etTQZp00XeiY0wvVC4Y3n6p0lP17SsBa
         hwSQ==
X-Forwarded-Encrypted: i=1; AL+hErEWnGnqA+RKkA6vc/l3Kt5ebs0vJbXL0iBJ+JyfD2ZQefYl5ooT7t4uZ+/eLXgmhwrNXtwXkpELSh58fqmtOLjtnw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+e7DDrjFA2NUy6vXF1PGubx5OH1mclTNN/e1alEF24BXTMjl6a
	bKslYo8mEC4sRtTRtgOE574QXMGo2PE+ipRaItyu1MV8Ypqqlk6w+28F
X-Gm-Gg: AZFdTZcEhGhKSIQp5zuzWKzRBqDKphrPBOTyGbvIUQfSpgNwZfhCFfFxqMXtIwWYQAL
	WYuY31sX73YVlIZSdySnuYLo/b0tmgbckD5dkgHqQntG/2cZD2s/YqBvZ8RmoQ6waT8EkJgbkl7
	sm9L8+EnmbR+4ZT1+95y0Mr+nBvJ4RVv8uo+7RZkCV3jePC8mJ0nycrPhnMtOCId8drivlqZ8NC
	gZVJhCyMUVFAzF21/Aj/8GfTK3lrsk4nhgv700AX/Se/LH/Q8++QtRv/7nm4cQwLbgCvO3hydIJ
	acJpQj3e5oiXqkw6wU7YnF/Mzlwrznom/rymnmMXNxxxH2sdsWMM7f9F7PjhdQfXWzaLd6SwtgG
	P8VRmudoqJo1QAdosAQRCYNM0hoAD61QxPh/r2V5OfJ/Fk36muwUX41haSS/3eo7KNnV/hTjl+U
	CgMS+VGcwKZKgOQVmbWE885Px1nrdeZlgSANCMOVm/cwSBu1NPFE5lHTNUPbfrbznUeNZC5a+qa
	px2NXzRAx3XLd1YndPZbyJnJtcBhMBM/zzCZAv2CwymBLlfx7Ot1IPwVcE1l8i9kxCyXv+2+YFt
	Ia2GT0wY3t0I99A8LwsEg7UjQDTnhU6X1X3Ikq15CpmCrZE=
X-Received: by 2002:a05:6000:288d:b0:490:a3e7:8af3 with SMTP id ffacd0b85a97d-4abb73b516amr57641981f8f.35.1795818737759;
        Fri, 27 Nov 2026 14:32:17 -0800 (PST)
Received: from localhost.localdomain ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm49465507f8f.51.2026.11.27.14.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:32:17 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <joe.skb7@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
Date: Sat, 28 Nov 2026 01:32:14 +0300
Message-ID: <20261127223213.2481987-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DN5A4ZMSEDUO.FUSGQTLBRYFN@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org> <DN5A4ZMSEDUO.FUSGQTLBRYFN@linaro.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Nov 26, 2026 at 04:23:15PM +0000, Alexey Klimov wrote:
> Regarding number of channels. The Exynos850 spec says that ADC has 10
> channels and, looking at the registers, the ADC_CON2 register (offset 0x4)
> lists 10 channels as acceptable ones.
> ACH_SEL bits [3:0] field in this register wants to see numbers from 0b0000
> to 0b1001 (from 0 to 9) and lists numbers 1010 to 1111 as "Reserved".
>
> So, I tend to say it is fine to have it set to 10 if it doesn't trigger
> any hw issues.

Thanks for checking the spec. Then 10 is right, and channels 8 and 9 are
probably just not connected on the XCover5. Reading them caused no
problems here, so no objection from me.

Adil

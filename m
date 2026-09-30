Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F8634751F;
	Wed, 30 Sep 2026 05:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746240; cv=none; b=N7zuUDLpEfZFzkzYsEsExECCFdjVmYuVBAmtrGvuN5F5QSXs9szXL04eY2UeoreK0q6/88bK1Cvh8D+T37fTyN25OYfux6eGFC1nIYZKwxMiOHu8M0sCEeyW0Ik4fa52YkKT05SluoA0K+sa6xWz4sl+ngbRu2eoLct2XMjNJXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746240; c=relaxed/simple;
	bh=R0PKlgsMCmH//j9N2UgApz4AJZZfIiYOyZvcemoC4f0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oCRRTyaZbqEVPH2gWLttesJeDqR8W1jB1eLp+Lc1MwbRpAgjBnxJ2IiY7SaolMGPgQ9T1oHp7SddoXPhCgE1LUcsBHRW3Gy30OXyrV9q9Pyj6nRimcbbqSRiy7RWr93aUS7PsF96oVcUQHEWQ6qhmfRvV7dUdHQSd0o8NskKnNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaHO4Ecx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaHO4Ecx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03171F000FF;
	Wed, 30 Sep 2026 05:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790746239;
	bh=bner0SsgdNSy6tdybRuNPu0GjFr53uKm1bBPGJ+rz1U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WaHO4EcxALHP0aw/fQYTf8ml8HCvmaKsZCZXQr89mBmFNRjmntjEJPUWFmbT/nNKl
	 dwAhmUrPJ9BJdw1+wdZi70OQTFuppDMz3Gz5e3VnMKxPhQpJTYKUMT1cY2/j39CGgn
	 5w1l5qzQKPSCCXW+bD8Oq6aAh09Oru7ctSyu+bTkYDhX+aA21VqAeNfJXbdFsRx7GZ
	 VLTmr1jo390M2nVx1IxfyhGZ4em+TTR6RuFoIyOoVdvgW0885RGpmxNBd/d+oLUjMR
	 apfIdU0lCWV44/Khqj70zER9byB6PKDZySKwlHrjErkxlF3FsKW/+EvE098ps/HgaI
	 WDJmWaXe1es6Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com
In-Reply-To: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
References: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
Subject: Re: [PATCH] arm64: dts: google: lga: fixup #size-cells DT warning
Message-Id: <179074623441.18076.15900308242524005401.b4-ty@b4>
Date: Wed, 30 Sep 2026 07:30:34 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Tue, 29 Sep 2026 11:11:15 +0000, Peter Griffin wrote:
> Fix newly introduced DT warnings:
> Warning (avoid_unnecessary_addr_size): /soc@0/interrupt-controller@5880000:
> unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
> child "reg" or "ranges" property

Applied, thanks!

[1/1] arm64: dts: google: lga: fixup #size-cells DT warning
      https://git.kernel.org/krzk/linux/c/18686b294c6f6ba778cba66eccf01b9fcdf48988

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


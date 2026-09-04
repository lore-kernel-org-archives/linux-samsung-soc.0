Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857674F55A4;
	Fri,  4 Sep 2026 15:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535750; cv=none; b=GI2w2OFeEr9sSevycM7Nrrog/jahOitcKEsRjvVp+4faCI7kR+a/0VW9gEtKcqpVCh0gvJCc1EcGXZn5KJOZakj+B7NM8NOkiRXNQhr70tWefD/0RL5DEc9o9/w+ybolfaXbMq1Dc/b0yzjyp4YROWlk0rAUCWUMuXvc8L7mVRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535750; c=relaxed/simple;
	bh=LhTIcTSwySpFFGAnHmW7UyFf42yz9dgAuGOJs1C6GyU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hUDlrAwNa/Q5O9bSL0l0gdaDm+4wIE2SVwOlkPeF477MRjoCf/89AB/kRfphXBLBRjvoLo8q5mrSoZ5+zFfVwpvXTRaH5KQqvIlo5qmnWRB7crUT+0JI5/0yvYiqtElXpDqaIaIB9sF44FRFQfEazvb8NcOealpdAwPC6hUtujQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9x9RfFk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9x9RfFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABB31F00A3D;
	Fri,  4 Sep 2026 15:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788535747;
	bh=S59pn4AdRIyLRvhOPucHITzh03WSsw1V0FjkG04Ptb0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W9x9RfFkJ8m8OgJCTWC/xbbbaPZcAmvbxvyJ3GPOLaOuthWQ5lFs6B18rMiGPx00j
	 susXE+7eT96H9NfANCHEL4C6ACjzneUdJiTgp4dkmj1JpyjUOGtGAKTZqOZARpQbsR
	 gKknyVbzF4POr2qPGTibRc6FvzkLlxN/6u7H+fdPv4q1QKNAYWo73sziVAuSqhCALb
	 M/rwoMzeEF/JT2J12choMcRcVAS+QZwona2ZxJiDXSB+pHd5xzzkJQv2zbNextZYaO
	 254wN6xHcv9eg0LKNmR6cD0gzfSre7GlyNBt0E4NKFJEvXXaKbI7Y+k0B2CYrcOYHu
	 YShFytmkrKh7Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Aiden Isik <aidenisik@member.fsf.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
References: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
Subject: Re: [PATCH v2 0/2] chipid: samsung: exynos-chipid: Add Exynos5515
 ChipID
Message-Id: <178853574392.59617.6944146590996935524.b4-ty@b4>
Date: Fri, 04 Sep 2026 17:29:03 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Tue, 18 Aug 2026 16:05:41 +0100, Aiden Isik wrote:
> This patchset adds support for the Exynos5515 SoC's ChipID to the
> ChipID driver, and documents the samsung,exynos5515-chipid compatible.

Applied, thanks!

[1/2] dt-bindings: hwinfo: samsung,exynos-chipid: Add Exynos5515 compatible
      https://git.kernel.org/krzk/linux/c/3de7d6f8dd121d5d4b74182765be5ee8f3954d29
[2/2] soc: samsung: exynos-chipid: Add Exynos5515 SoC support
      https://git.kernel.org/krzk/linux/c/2f04ec82e51da9d5af5cb48c9f24c0318655b0f7

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


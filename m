Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75B73D091D;
	Mon, 27 Apr 2026 13:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297928; cv=none; b=epk84vDL5IZjiVCtPG/arvu9/U1UDN5NGt669EVViw0YjmDwnL50lpCgKgnXV8fmZ2sihItiKjZC+s5uSw+bYdIc6COBpnV2Gfy67jSTZY5XdIhFSvKlgbLSSiPusla3HqKPBikrNQLTH/GIye6c/lBBVdoHii0NMRNvVJVXMm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297928; c=relaxed/simple;
	bh=lsJOmTUcAu0z5/TAAJg5YU30Hd+zFvlOGUzZYlCCFVk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bc+TiU0Fr9RfGp+5xseTYFI14+xA4T19JRJU5SLkLJh86adLcJhG1DizII4FdvgDPLJ3kCstnrsDdecFpJ4BoVRIYs2fDwngVZCZvxMmZu6wVn79Iv8NeEnwgdvN/KPaphqZ3Q0/fbrhHT4a6W+dI3+1OEfj7SczAaTW+RDphFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9wasWs+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9wasWs+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447BFC19425;
	Mon, 27 Apr 2026 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777297928;
	bh=lsJOmTUcAu0z5/TAAJg5YU30Hd+zFvlOGUzZYlCCFVk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M9wasWs+kX1157BtlmeT/XCUGBiBfBcx7VM19UG0pPhERJucZ1KbNYesnSwTdPtNo
	 aCkDdFb4NbnO/v9JZcC/ObluckiS6MM+aHwILzKI6lR5n0HkKPN78lhxssnGCvLly6
	 KPH2upNo+AM3S9++DAYqQaxAKmqmoPV92xXeW46IFAGjrKs7vZJTsuJeFyM66F0EfP
	 3vYYvrjm5QSXwFFzA/0BE42ag38guhXggh5F5W8qp2Co7PP6ep51xembSFQ7VvEL1e
	 IhRgbmY7twggmNHs50CykkTIIkXp2ZdggfXYC7DY6ZFXW40LsU8u+eKGdX8iAB/Buj
	 8zGIJ+uTehw7A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260325-exynos850-poweroff-v1-1-34c19c06e74d@linaro.org>
References: <20260325-exynos850-poweroff-v1-1-34c19c06e74d@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos850: Add syscon-poweroff node
Message-Id: <177729792499.37277.15065378345942727553.b4-ty@b4>
Date: Mon, 27 Apr 2026 15:52:04 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1


On Wed, 25 Mar 2026 00:26:32 +0000, Alexey Klimov wrote:
> Without poweroff node Exynos850-based board continue to draw current
> (around ~60 mA with my test setup) after poweroff. Kernel also reports
> different lockup problems and RCU stalls warnings continuosly after
> last kernel messages about hardware being switched off.
> Turns out we missed a write to PMU's PS_HOLD_CONTROL (PMU + 0x30c)
> register that actually switches the SoC off.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos850: Add syscon-poweroff node
      https://git.kernel.org/krzk/linux/c/47d4dc90181c8ffa9ebcbd058e312873a46aeaca

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


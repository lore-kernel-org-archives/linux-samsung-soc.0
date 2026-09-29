Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B321E3DCD99;
	Tue, 29 Sep 2026 05:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660971; cv=none; b=Gw4+fsTf0lifKoJEKi0C2kLdenXoMXbOpzr1WprHNfos9YjnE6+mYx7K+n6vAsGCC15KgpTWkBQHpl8P6e16vp2vu8+3E9/CxRsDzmK30rIDZj11iZkqeyyh/Yf23Dmju9vZGaZya1SJTytSBLTIjfEF3/XpugX80TFx3SEj1sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660971; c=relaxed/simple;
	bh=pFdQbBu3o/F+DyBoQqDLWmF8YifqxHr2nAD/jIm495Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fMBV75Tn/CzRXONPGjqb4UlpvwcfNqhy6/nqUzArz6mdCpMT/YmAM1NRLxLLkCy4HoxcJbqqRGf6zFS0tO4mqdb5JoWkkCdNK7OSUizxZ5BD3H0B7czzV/nmhX4tcVs7f60ZeBQxzb821evNShB07d1qngh0/UTlflsfC5SO6Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enWdZG89; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enWdZG89"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A1D1F00893;
	Tue, 29 Sep 2026 05:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790660970;
	bh=j1S/lX3D2zZ57yEJzY548RjwyLs+Qc5MvhmFefyEV0g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=enWdZG89UD2DM1Fya8gPx2GJrWxVR1QyspSAgl41Rt6k2BTG6jIfmeKqCKOOBALId
	 0AV1AlZREvDdPOspOMg4ksmsu0uuWEvSnDsDtoORi+zy+yzbmjvbwzblGqhtqufObQ
	 PvT3aRpnmyg50V0vXD5ElEi9LJDSIzrUNVln6DjWZJekCvnWd+AERENBdiyjlHrxX6
	 BLufPBNGhT5n7H3u3Rv3j00CJQuRBmJlJ7tSQ8lI8hTjeFAYQDbYLX2wJG0j4N7ctB
	 K53wROYwkth6cGxH3lR7yucdhjlhMnb2Gep60ufjCIU0vJ+jhDj/jRAxwS2hUkbdZv
	 4P5f7dureY0mg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Waqar Hameed <waqar.hameed@axis.com>
Cc: kernel@axis.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <e55caed5ef7d902b9e1f0635ad704c61a6dbb7cc.1790629313.git.waqar.hameed@axis.com>
References: <e55caed5ef7d902b9e1f0635ad704c61a6dbb7cc.1790629313.git.waqar.hameed@axis.com>
Subject: Re: (subset) [PATCH 13/16] arm64: dts: exynosautov920: Add missing
 space in compatible
Message-Id: <179066096599.19907.10125408562437494172.b4-ty@b4>
Date: Tue, 29 Sep 2026 07:49:25 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Tue, 29 Sep 2026 00:38:24 +0200, Waqar Hameed wrote:
> Tabs should be a space between multiple property data. Found/fixed with
> dtfmt (Devicetree Source formatter).

Applied, thanks!

[13/16] arm64: dts: exynosautov920: Add missing space in compatible
        (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


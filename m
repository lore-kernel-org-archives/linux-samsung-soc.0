Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D363835504C;
	Wed, 19 Nov 2025 11:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552460; cv=none; b=WeEXlec0AjjA6kpnHjtZi9qEzYdKxfhSWHcO97f9awkLevYCA5ymTPL04kcMVganvv/ntfKVQNEnjwRITbDLIv6qg5/x5lOfLISwN95hqpDHveurbNGlWgusreDq5R1lnBqnGU+eAO3br0vZKOUuTPHClCQYGZoQrAobU0gzpIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552460; c=relaxed/simple;
	bh=iaVK1qlAbnEZWWMS3zhV7Y2UWW4qjvNMuSBwsQzHeSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nbSWIr6Djk14vpjqAI5c9vuSUmDOhd/ONa2MHXeOuq4afw2IX8O2YywmMqUuCiCfrViJluyp6yKiMRjPuweVcZUoI1jS61JWGaGHDrxk2tPZUdWOKsrQN8eaeuPzbMy1m0R61rjkFSLz/fGu3A/whA2H/2b71zUAjLZK7MHfc3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDPjxgPM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDPjxgPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0C8C2BCC7;
	Wed, 19 Nov 2025 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763552460;
	bh=iaVK1qlAbnEZWWMS3zhV7Y2UWW4qjvNMuSBwsQzHeSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NDPjxgPM8nHuK7/zeErqermawLozos3cqKBL8jTZjntFLwgse6NRDzyf8YT30rLrv
	 ADSJvzdBJruqg0xRR9QBpnDR1Zq3yvfYJ+sImCMncw8XuyXKvJMoxVQP3uLufBZL5I
	 flY+6cCcWWTcLysdg9SZlWE8/pPFYr/GoXZwA7K0dor1/klz698ecUlSKTusNvX7RQ
	 4z557Y+GcE99IOxRmY8jTMxB5AM/MySI/RDWZJatKCwq8IgsuPy5h51CSbUfsIp5Ma
	 XpVsF6grZvlvR6csmfDCWNSug0E/nOB8Tkwl64481gMfpgIwdQ+k00T0b8HbYfc9r7
	 +u66OFCo6mE3Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com, 
 sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 cw00.choi@samsung.com, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com, 
 bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com, 
 lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com
In-Reply-To: <20251029130731.51305-5-ravi.patel@samsung.com>
References: <20251029130731.51305-1-ravi.patel@samsung.com>
 <CGME20251029130912epcas5p2f6596fefe3fe5513958b8209e78fa2c6@epcas5p2.samsung.com>
 <20251029130731.51305-5-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 4/4] dt-bindings: samsung: exynos-pmu: Add
 compatible for ARTPEC-9 SoC
Message-Id: <176355245287.116968.16322635190742464226.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 12:40:52 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 29 Oct 2025 18:37:31 +0530, Ravi Patel wrote:
> Add Axis ARTPEC-9 pmu compatible to the bindings documentation.
> It reuses the older samsung,exynos7-pmu design.
> 
> 

Applied, thanks!

[4/4] dt-bindings: samsung: exynos-pmu: Add compatible for ARTPEC-9 SoC
      https://git.kernel.org/krzk/linux/c/dfb59d7319915926a5606ffbccdb924b09f08cdb

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


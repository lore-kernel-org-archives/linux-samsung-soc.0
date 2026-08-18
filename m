Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0D63AAF65;
	Tue, 18 Aug 2026 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787065628; cv=none; b=kdG/vbaQKNmhT0LYSq0fSAhZ3z63v1k4O0R+LQq+KEIhoGMHhspTIbxVG1BxR35qPKLhe+9awrIC497e5M2OER7D4ZM/ibGO6LUOdD7bVN0M6zE5xLDWsSxnjT0FBrnN+zUn0HoNEWnrlhT6Ls9Ix+hqR+QGYROGyMCdPCb2Fj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787065628; c=relaxed/simple;
	bh=WvhBurIy8A9u46LETLcI/MhJB6dhjgHJNOfnkpO39yM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OR3q4PaLV0TEwHXSTPWmOWB5Rz9GkfyROteU55oEhV3qMO7gsSSEhccFTcRtIuI6y8KpzgrJnjkpjAxK38sZQldytt6PeASEYUoKDskZlWyFJEEhiw35MOXbsaQLUIVhzQBMZTb+FTQE9XswJP4drLpvCk+UtjzS/NSzh1azS8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ua7GKg/n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ua7GKg/n"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F167BC19425;
	Tue, 18 Aug 2026 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787065628;
	bh=WvhBurIy8A9u46LETLcI/MhJB6dhjgHJNOfnkpO39yM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ua7GKg/n78G+6x5wGqpZWztUUBV/90+g6Hn+TSh/UyxK66rCPQbRMiY/AFqVVyxm4
	 fsDRuc+TBTz5sFux0axgOWdoNqwdT4zGM2WgyPEERm/WNZzFNbhg2qq2EOHyrE6y6N
	 ykwnTFZk70+XwTSrSAUwFh4XsOZI0F6S/DN2lMytCkIeeIMShJXRfDiTPb+cFX1QC2
	 D2MEpKcAD89Jl+/7b6ViF8P2aoyrNwZXofno1ytxSeELQc0U4pkM0iqZLxh6ZdRQzg
	 7KnhZPw+9cfueCLg9U1hLX5LS2psCMjo4DSHDat5roRyuQUdmvxTIdoj1OHlhTjyy6
	 nytrus6OZPx/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32F4C5DF7E;
	Tue, 18 Aug 2026 15:07:07 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH v2 0/2] chipid: samsung: exynos-chipid: Add Exynos5515
 ChipID
Date: Tue, 18 Aug 2026 16:05:41 +0100
Message-Id: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMV0hGoC/3WNyw6CMBBFf4V07ZDSyMsV/2FY2GEKo0JJCwRC+
 HcB49LlSe49ZxWeHJMXt2AVjib2bLsd1CUQ2Dy6moCrnYWSKpFZFIOxDjqaB3iP+FpSwIZ7roA
 Q6ZonmCU6F/u5d2R4PsX38st+1E/C4bAdi4b9YN1ylqfo2P0i6b/IFIEE0iqXWSpjlFXRUqvJh
 cab0LpalNu2fQAyn4+L0wAAAA==
X-Change-ID: 20260815-for-next-lucky7-chipid-ecce496c86b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=WvhBurIy8A9u46LETLcI/MhJB6dhjgHJNOfnkpO39yM=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqhHUYUQuzBprixPTgcy8Al2eiWPDlLC/auEuGJ
 b7rFNdrS7mJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoR1GAAKCRBJJwGyxHrX
 68O5D/9JadzwC6VB9ScxAL+6S15RFJRmpF8VOn9qdwnh1WYZ/VKTrD9Muug4e+F9O/nVw36zojo
 6vo5AtQFlGMkvcJgMVQIPmjvdgq0YvbSkAwwDrmdJjW8U6GgGo04uFo/HbXBgCfqR+0F3srM3b8
 vlDvy9MKBTNkapfZqRINJj9oMp1fxL4Oi3YiFNC4s5Vv/Bjlek56JSmnreByfg+I3vZ2Sqw3L4k
 ioG6UdUdqxO1oAOiXZ++aLIsNdLot68PYvGwK8eYmvn5okRrqlJ7V/lalAqt9CuqgHgebX8+iwq
 yhWAjBsYFGklIxSZzNdY+83NKI7adh1eNTHLVXSSL6K3zfxzxCWAKb5IQM9PNcPEDwlFautb2p9
 EGJ4RY3tkQlR4lq89e0XzsXdKVqR/FYFR+Juy7wYc8iIr6EM3s2z78DS/3++RNkzRSSKYpTSbwX
 fKIS92m6rJrkvaKeUfQy4U2GyHpMzlFLJUlgBahOdlIULWtw71lgx2FZXdh60NV5Qil0Tx7aDP9
 dACgSMQ1ua0uVicja8Nn8t0S+2cqh8uB25btvPiKL7vaIhgiBHziDmnr6XiRSUqNJxTFlg0m92n
 8OonV5m3McfqvKK17kuRw18g0r3IVV52n0BY22TYPW6hZU/G3abqiC3J++y4pkSU1Ne9kJ6GjXI
 8qviN7VZfUqd1hQ==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org

Hi there,

This patchset adds support for the Exynos5515 SoC's ChipID to the
ChipID driver, and documents the samsung,exynos5515-chipid compatible.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
Changes in v2:
- Correct capitalisation of "Exynos5515" in commit messages
- Reword documentation commit message
- Link to v1: https://patch.msgid.link/20260817-for-next-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org

---
Aiden Isik (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: Add Exynos5515 compatible
      soc: samsung: exynos-chipid: Add Exynos5515 SoC support

 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 drivers/soc/samsung/exynos-chipid.c                                 | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: acde40ba506aae78633e080b5704d33cf4bc13c6
change-id: 20260815-for-next-lucky7-chipid-ecce496c86b9

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DD43BB674;
	Mon, 17 Aug 2026 10:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961513; cv=none; b=n6f0cVSs0sXneC/fj0eXXSybLXuCejwI19QKCYBh6ZbpHpBI0YWA5NwfH6k/f/iotkWud74rRer9sZhoSJRWnVw7tdjIUEWWteZmw3A1P+/uE1KcH+nHTGSMsXnIewO5rYSGZaYqqEcmF4YXcswE0Y7yrtwmWAk6Z5xp9ZkgWXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961513; c=relaxed/simple;
	bh=/TB6SF3H4ZNKQZQfem2xpHooLxhbf6fX78+sfpapzYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJQX2bvGzw0r0M8dmZTslH7s8cBe7dFSeXLsrDf+c3W7Smzvx29E/Zhf4467D473pjmFkuAzW19S5sgCckz8gWKtx+TAvV2pOFZphNLtV8F7e4HplKmZ8n52nOLQVn1TNohwltXIfhQsi85vw8UIczv0hOjnY62wc7zUgO71Fbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCXqjMEy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCXqjMEy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F48DC2BCFD;
	Mon, 17 Aug 2026 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786961513;
	bh=/TB6SF3H4ZNKQZQfem2xpHooLxhbf6fX78+sfpapzYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TCXqjMEySB5huZfieGgW6FSwySCrO4iuefCZZot7QLSW+wDge1ukX3axSIH+obLxI
	 2sNv5IC1T4BTRW73ubbSb1fypn2yYGSykZtgVjTujoDW7aGMS31PkjM7Xo4XmTJuXI
	 NjrkfiwRtRbRqS7hCFrgJMmcLqbmKA4zDKXfhAQy0elbO5mfQakjcIdTT23ogaUZDi
	 8Cw8jxsTy0pX5FORx5OP4Bguu4SjNPQe7Nmo1pHOWfRgSP4jn7KGd1YbDGogtz9S6g
	 r5kiJsspyzdjDeduKO9bHQZsf7vF1owLxiKSLLy2nw39jkUSM0UpL2auHOK3DPK7jn
	 A0sHwuUzcrgjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB04C5DF7A;
	Mon, 17 Aug 2026 10:11:53 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Mon, 17 Aug 2026 11:11:46 +0100
Subject: [PATCH 2/2] soc: samsung: exynos-chipid: Add exynos5515 SoC
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-for-next-lucky7-chipid-v1-2-eb2908705c0d@member.fsf.org>
References: <20260817-for-next-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org>
In-Reply-To: <20260817-for-next-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik+git@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=4onVHAcKrIX3AThzDNrMPzjm8bkKJ6d7i9OkgFxnui0=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqgt5jjXi6Ca6VVlGxDztOxUyWZvUX3u4J5Ehk6
 PXLoLz195KJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoLeYwAKCRBJJwGyxHrX
 6/t1D/9XbqUBfGopw1OhVfelGWacYdVcNcYQn/yhhtEBjjnHZRKHvtbgKHwp7lIyxE2zllPgiTu
 vVbID5c/vaScNWJ3R8Ch+CcOb3Tkl9cFVov747b4IwlhPcnW5T0uBsuGgwGR4fGbn/M1JQI70Ex
 BBFFIGEtKlNj/RTt7EBztztU5U3Rf4K25Ha8DwNQG7j642vi4kYrH9W0VhmB0dI5fVPShv2AmCj
 /k31Fl5UgNOPiwUoEOehtbRo93fSXPsJc92IoVex2Ty9Klrfs77z/QgSao+XOk0opC1DrOHgfv8
 A7cFxmP5XZwVGHKyalpfhA6niO/kZal9mIZl4e9PucH8KPMB0ojXGcqCd28yx/5VN5n0XOtwwXL
 SUXGCuWei4PFiWwrsFi6+yAv3TP0ZaBx05NXq8LwW2DpDSD7JFQdhikarievkdar4X4NOAFKCEc
 DYlVylvT1rZMRkw+t4Y3vgNFoAOUfQZikKQVzPWfODlHx8MrXmvqsIZq9SVw4bEwN05nfReguhT
 pwzZ+ZIlFijHzVxHkSvOg90q4fW0hszIrr8RX/IBFKvP3YSxv6aO2fvZXNQF7KVZQ6zaHjGjSqL
 +/46N/KKXlvcqGa9mQm3JMyCzVMPfAOFyQ2FEQwU65RR2/llZ2+3WAZtCVvgr9CgwOPORswxbVr
 2NRfZIYGHGJku0Q==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org

From: Aiden Isik <aidenisik@member.fsf.org>

Add exynos5515 information to the soc_ids table.
The chipid for exynos5515 is "0xE5515000".

Signed-off-by: Aiden Isik <aidenisik+git@member.fsf.org>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 6ef9751e2509..506a0bcdfe30 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -64,6 +64,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS8890", 0xE8890000 },
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS2200", 0xE9925000 },
+	{ "EXYNOS5515", 0xE5515000 },
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },

-- 
2.54.0



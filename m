Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E35630E84A;
	Sat, 30 May 2026 16:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780158894; cv=none; b=TgAjlJIMxKH5HN+Rjzd+3szkdgLrRpfuEm6S7XAvqy+XKu2Zq9jo/Dlcsw45AF+ZJLKbBRRIC0swJVQqD/niNmUDu2aMqRqdaIkLSaVq/18swjrM9Qzrs2MIwxgBlZK0QUw8kbPxndHsAtvpKeiNgTkZhNFE7AUBhiwWfHyvk7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780158894; c=relaxed/simple;
	bh=5uv27g2oDPCBaPOrRVf+2MQ7YH+CqVrbxmuSvMDlF9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=guSG11hEcpXE20rLAjXu5tbgJOcWO5ulAGZM/GXMFf1jKsfpD4m3UIVynNzd1O8kN3DY6vZQ4nJZdmTy5H98pT8AIjMggBXqT0+PZd86r5P7+Z7NsuSVV2/7CQ/Yk+hK6pItAPFJDBYJvZRDpnzT+SA9AcF5geJJB6FHjPj7VFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+qUNwhh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+qUNwhh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B451F00899;
	Sat, 30 May 2026 16:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780158892;
	bh=+5NDrwDJym3Uv1DPz8XoMSgHuAayDtigJhu10Nj2YoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a+qUNwhhJLQeEPLHkh36LAfgqIc49SCQXi34MOmqiaFQr42q2LWQPiUmM2uH1E/YX
	 c9oinyC5BT/G4cAT1k+Zl5G4ii0WNdRvwAoJ5ibrtRogY6eWIYk7tJkEvHDYtN/lAN
	 FNc8QE/T3lKbK4VrPsFc2FhQhdGkwNqYvcCZmkOCg272zhNfn55IS+nwlqzhM1aNty
	 tf9OGPg1VkuP+waan39rtxM8Drj6Hu3DCMEcVDX4cGp6elk9rUn3+eKFSKGZEzbN5J
	 ALx5Jy51Tfmxv6/G0iyLBC3rsMOLaH/OiibnHOlZ6XFpWmk9sEmTeC5JaoImpLWvMB
	 iXyNl642pA5/A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as a co-maintainer of Samsung Exynos SoCs
Date: Sat, 30 May 2026 18:34:40 +0200
Message-ID: <178015858043.36212.8088079079471293822.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527-samsung-soc-maintainer-v1-1-40829c3fb133@linaro.org>
References: <20260527-samsung-soc-maintainer-v1-1-40829c3fb133@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=krzk@kernel.org; h=from:subject:message-id; bh=tpIjyac01EcbfvGyKcSJyK4EU8AdvfjQL44NA7Y2MaU=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqGxGgWvj9lctOMdAqLOjcQqFFDJo+c2BPE6BTn 3lfBoQDdSGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahsRoAAKCRDBN2bmhouD 1ystEACWVTUMdDRU8Gbz57D5a/6aZlJHyyb/NZBpagrn8k5jUNzgB14+PTrqMMrZvyid2BAarv6 //NcRYph4FAjqGlbHwg/2Z/39SAeu0/pAWptNs5kMim0BMgKiaGCrRJA/2dWqrCPwBFBCQpoVWb UMvW0LeW8qlINSEASdDKih7GqTtEso7AaK/FE5+PEFwE/zzY0tKcRGZTW/vGAbq+Was7B3f+Eag 8YUaxNvjYfMC8OXuQMD7KrPz86HUuRABHX72Jz1ktFMayx8ZEi4+fvZ3I4QvdewRe7j2YxoYtLX Me6+1V93QtNN5zVvpuB2TNXblxxrwweAj0D2BXBnXxt+LCP5hKgWsgPgP/hu3Q0CKRsq0YTmDuf mQaXCg7UcRni/nAIoc97XW+hfMl5IHyBsUdbO7t1rVdBF8QSB1ZNG545qOe9wvJfRNK7CZbIbgv boesBzoivUu1xTWHp2qFmdMP1MrtsJern5zT0ZrK4s1R7J21xXP4eWjuyi2QabGJYzomQrnSOCg K0R5111jQG9dFG/mRIBNfaDMkr8pQx9Lzbmu/hvaaFi3dAVHQwrhdwGAgAzRy4JFVDmLxrMO5KE 7FMiMlciA+8VB+cY1p6PqpAU5eUseI8uazhkssUsH1s4V5Dknby9x0FVgybrX5TT7dWbzOqTfac mZ+n7ib+J8j2E
 ig==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Wed, 27 May 2026 21:24:29 +0100, Peter Griffin wrote:
> As Google Tensor gs101 is based off a Samsung Exynos design I've been
> working on many of these drivers and have an interest in helping maintain
> this code.

I have multiple subsystems to care of and limited time. Also, with joining to
SoC team I figured out it is good to plan my succession. Or backup.

Peter shown both time and interest in keeping Samsung Exynos code working, thus
considering above, I proposed Peter to become a co-maintainer here (same for
pinctrl, which went via different tree).

I will still be the one handling patches for this and (probably) next cycle,
but in a further timeframe the roles could reverse with me only providing acks
or reviews. If this works then depending on other duties and amount of work, I
might be slowly transitioning to leave Samsung SoC maintainership.

Applied, thanks!

[1/1] MAINTAINERS: Add myself as a co-maintainer of Samsung Exynos SoCs
      https://git.kernel.org/krzk/linux/c/20550601bf4c23effa013a5f37e5250618869e87

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

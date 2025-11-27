Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9CF335577;
	Thu, 27 Nov 2025 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764257014; cv=none; b=jetH6z9UyOilWm7CSbuzzFXY98scxwdMH4pMS6TpE2L+qBI8xLIewExkPltqlv001FH2GPNBooNE9u1wOOw/2tHeTZVlHWRzZAI2PSid4uVlQf+X/TiADAlKJEc9iiLMisoq5FevFtvkdoTsXGLV17bXYlohHSVnLpVs4Ps1M+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764257014; c=relaxed/simple;
	bh=O9bWq3Heg35xP9iDR9rxoZbeizhO9yXx4rGvMP+yDEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MQKSnXZQpdNLo28i2XKgoVq6foX+tSPAYr3xrgvUJMZ5D07NUl63NFUQBCvwVcsupHtj/CpYxuri/bW/vAwMpBJoTcsFOmN+NWdkl2wPvxi1ht21MPRh8smRCg2zUbLYoMFm3N5YWjurcpT7NlfQWZLiUlfjE5dZjxLcPmH4YhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHgPTi/Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHgPTi/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F109AC116C6;
	Thu, 27 Nov 2025 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764257013;
	bh=O9bWq3Heg35xP9iDR9rxoZbeizhO9yXx4rGvMP+yDEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mHgPTi/Y6FvkFtq5W7gpBTlylNDrFbLTF3sKnHq2agIVBZURnlMnRGb5BAaUK0kU0
	 5g2pfv0XTxxzbBoIrws+4SyLWw7FHhnRvUj5S6VAOlF86n7edzYVDKNA3uIWqTxx8x
	 KeHTD8ldmEuRYbIHYh5AhcZrnm+CXgYAbEwaAiP0cxnWpYA/mcBopsqvMc6SAKjl3/
	 DFxXqkPAF6Mb4TgnPs+WJgbAMxg66pldzo/laQxz9TBaCWvoadjgIuZzDX5zsvqnIS
	 c/NBZspp1DvEoYe5empBgfu9DfvDb1OItQBaHfL8qCDBzXYIDQqcCCLZEUkGtBVzj4
	 HjnrRtosj+Gag==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v2 0/4] Exynos4: turn off SDIO WLAN chip during system suspend
Date: Thu, 27 Nov 2025 16:23:28 +0100
Message-ID: <176425697745.207453.7551239525844517303.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126102618.3103517-1-m.szyprowski@samsung.com>
References: <CGME20251126102626eucas1p1ff6379819c325f0dfcf067ca0588ff5c@eucas1p1.samsung.com> <20251126102618.3103517-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=krzk@kernel.org; h=from:subject:message-id; bh=orC31108z6E/ytBErZUsAxLYgQfQjSgrQiycB0wWT1c=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKGzvVM1hD6edJiqDjSfOCPsAbIPkwyIcnaTYc uJDXgwgoy6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaShs7wAKCRDBN2bmhouD 16JLD/94o2U+CndUZ2g8a0+Qu2+eslZIa+oKrDtjvuFRjXB4hmlhyw4w3tFNaPkDRR2VPMV/hoz Q0A/SOh2enLNX/7qJHXLodzewQpEbzBZNWOch0PepqO67KQ7f/S6W2RrqC7a8wK4ciUqoQfKgih c2hhphP4qncCMkwbWVz3sJtw+S42pC5XhvHe81c5alyryg7ZwK2hbO0+lk7uZQOPd7Rx1Ev848A GOpC8uaZnzwtO1sfcwwxsvIms9EEVUUsKBjjJ3YdK0j18Fb0Ln881FU7dr4w86ZRA7Ew9WrGnGu 0BP7DOQNckAsJ28G/3TvjBQo93TgfDRexgZ/Hzmrdwc/vuSoOoKGOtYrwK/1ZqF0nlcatOznNd7 599FSKF8GNJtpm90HQSwmdQsFarNxM4WMpns+5QEB7BIDPe1Dkn/hlDhPW4ZfzKzTEX/mdlTJPJ zRwRDYR96UeYCjakmVjn0YtFqxcUP3LKSyZ0yYq4LMur/wZ84bKtL4tlGmPZcC7vfa6RE46UVGy tbDK3sK/3Ary7XZS6jMv0oxVX/EGl4O5Hur5OwljUnFjsLJUFHePS6cMRxbUVKUBy3yQWHwcRqb H+Z2AL/JVNXd8n79GlVQlKMVzo4JL0zCiKcfz+YCkFbkChWJMRp0WOxrDa9L3uJKoM/RdJDJJBK caaM1dnx9sZmJzg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Wed, 26 Nov 2025 11:26:14 +0100, Marek Szyprowski wrote:
> Commit 8c3170628a9c ("wifi: brcmfmac: keep power during suspend if board
> requires it") changed default behavior of the BRCMFMAC driver, which now
> keeps SDIO card powered during system suspend to enable optional support
> for WOWL. This feature is not supported by the legacy Exynos4 based
> boards and leads to WLAN disfunction after system suspend/resume cycle.
> Fix this by annotating SDIO host used by WLAN chip with
> 'cap-power-off-card' property, which should have been there from the
> beginning.
> 
> [...]

Applied for late, might also slip a bit for the next merge window, thanks!

[1/4] ARM: dts: samsung: universal_c210: turn off SDIO WLAN chip during system suspend
      https://git.kernel.org/krzk/linux/c/97aee67e2406ea381408915e606c5f86448f3949
[2/4] ARM: dts: samsung: exynos4210-i9100: turn off SDIO WLAN chip during system suspend
      https://git.kernel.org/krzk/linux/c/863d69923bdb6f414d0a3f504f1dfaeacbc00b09
[3/4] ARM: dts: samsung: exynos4210-trats: turn off SDIO WLAN chip during system suspend
      https://git.kernel.org/krzk/linux/c/97cc9c346b2c9cde075b9420fc172137d2427711
[4/4] ARM: dts: samsung: exynos4412-midas: turn off SDIO WLAN chip during system suspend
      https://git.kernel.org/krzk/linux/c/2ff147fdfa99b8cbb8c2833e685fde7c42580ae6

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

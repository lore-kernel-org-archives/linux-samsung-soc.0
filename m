Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCBB3F8819;
	Tue, 24 Mar 2026 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357131; cv=none; b=As7me7nAUWp59o/0Cg4jv8qITqZwn8KRnACA7SrvL2sJlNNU6NKhPNRbEWAY+UIdVU0Z9sz6DQJqDRd+rCsd0CQkYsxUX3Nv2kTGOBpCHJFcZtuExXY8QIA5cNmCkCQgSIAd1Xsu9HsvJztyc2Cs825oJGDGuE94h7MDqKVX+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357131; c=relaxed/simple;
	bh=A/J8K2+w9v1wDxavLP6cEzv4qbtsm7vPK1ygQauOSvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqY9md5qRSJx+/AmZi7nZfQiPUAP6k8OxyVf7FIXYM1UtwPLWjE0vrpcdNkenLM5oIeHhz+7Uej+1sQe3ju5EKi1mqsywaQ+uRQk5d0I9/76dKw3VXg3pF4CdhjHhnX2CgrMudX012oeyKZhY3HLUqm4uFzSLJiZIkj1ywRCNug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0vCS6zm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0vCS6zm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450E8C19424;
	Tue, 24 Mar 2026 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774357131;
	bh=A/J8K2+w9v1wDxavLP6cEzv4qbtsm7vPK1ygQauOSvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y0vCS6zmnPko+Shcp0DGlu/HqBfoxb6rm05pHWbw3fQBkAD++eX9q2G2KvSS+tqHg
	 S+1LKUxQaTwCJrvvG65dFaQzzjKN5eK2EoZj7oO090K2IgK7bj5sgqREcY16ByKCd8
	 FDnAzwySNim5AYd+oKz8bnT8UaZ7jIamSomrQLQsdmRcepW6wEo7Q8LIzlpC/ClTnM
	 05jXjm+VluhJPlIrofZcN5Q0JBvB5vxFstQIQS66pkVgdYl8FttCk1tNOKWIHUKFzi
	 ewOIExVZf0XVPLePseWCdOxIdm9yhFNwDtXA50lvwd0XRqy5BUNcxKJbmcNiV5EnTL
	 crAvGkeyhBBxA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 4/4] ARM: samsung: mach code for v7.1
Date: Tue, 24 Mar 2026 13:58:24 +0100
Message-ID: <20260324125821.59728-8-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324125821.59728-5-krzk@kernel.org>
References: <20260324125821.59728-5-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; i=krzk@kernel.org; h=from:subject; bh=A/J8K2+w9v1wDxavLP6cEzv4qbtsm7vPK1ygQauOSvM=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwopwirt7jHBLea/R92YkT++xs6N600UwKfdNB 1brVid79cCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacKKcAAKCRDBN2bmhouD 114eEACazJfGYdwz5FFHbQxtpT2DV+Q32u8c4D1Ovbo2AcnO+sZYqbd0dw6Aig7IcpWSL9hzYhj onv7fagUlntrXkwaVn6/gz+zCiy2TliJEjZc6jGzDDaYay7QgkRtpkYkMgVTTlOLhqcD4O41YQe dDezODxP3CQj59yhbI6FuW7aB+nNl3Dh4fOE0RHNPezPPQyxei4sk3X6vJYv44hA6/xAyiYceNV Req4VeyJw2OEZJK8iPpZ9z093VHaq65ToFbr4PS43WqQ4FaP27SDKIlDEaY0qZ18t6DrIsMv+zt 7MUH/Bml/yHIYg/ocOvjhtaeHhZr3l0p/nehYQBmjnQyKG5nzHOlpkS3MGYDkhoceW38IA6+/Jx +Jlrh/DCpo3/Dn3n7kjyfo8/jWcF4V4KRIrUCu2POGXVjebae7KeLyL367luZ5pFbIZIkbyrXZ/ 8D7P4QJd5kpZfm/LUltfwM0ycSb9fKbTewyAm3ZNaYqF0cIiEP2rlvmrDmmL83+y9K/2bm5yzyz xtLkrvDdfjxCmK0L8dAXkGXa/+lGhSnKv51j02dZtmcmau2c5HZKKJDlIMJ9T8IGv8DdPmXf3Y8 8QnkODStowMCVr39RGAstaSk6KkaRkDztyGkqD2i83tYbvnU5WehaVe5XaOjHHU03BU9P3m71yi NwvUz+B4hMd1b6g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-7.1

for you to fetch changes up to 32d4b991f25eeffac7568ef51367f924394fbdc5:

  ARM: samsung: exynos5250: Allow CPU1 to boot (2026-02-26 22:13:27 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v7.1

Fix booting of secondary CPU on Exynos5250 based Google Manta board -
difference in TZ firmware.

----------------------------------------------------------------
Alexandre Marquet (1):
      ARM: samsung: exynos5250: Allow CPU1 to boot

 arch/arm/mach-exynos/firmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

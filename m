Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C6046EF72
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Aug 2026 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056960; cv=none; b=cUjq73waYjoAhlYWrAC3772ntfEZXa9UzmmCRV57ThUjQQpKLvjr8CaySu1jMNdMWygR97UD6w/89yyGFL4JZvw3KX1OJSpLWQRtcy9sK4XhrqZXUQnF4Er25jltrchun3DJfZ+Cg4bVkz9F2BGU2Q9ZavuSLvHAwcYIV0TVAL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056960; c=relaxed/simple;
	bh=7mi1AUrhdHkL/XRZ/wvsDaei20q9/5sTD69mdIshz2Q=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=RVV832RHedUkP1bCqoqZA9hfQjzRGxK6OViG2cJKFB4iQWD/DVma5Di3uC7hHCUSS8JFUPufHw1p6siEQuAyOSlqsag/6t2DnlmyVQ1R85o8uVtuiIf0xUyfQn2BGuSZWyWczinFyf2cJ0pwcV5XHBK5GeuG95lR8n2SqHUWftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=X8bW75xb; arc=none smtp.client-ip=203.205.221.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="X8bW75xb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787056950; bh=m5rcVtiQLnt3VEN2AX0Md5NlpG4+1sGiLWVrJiGlP7w=;
	h=From:To:Cc:Subject:Date;
	b=X8bW75xbs47TUBWWhAy9W8f16pNDHNvg2DHDM4t3IlpLU0dmrfgQVnOelausIzDQz
	 ATIVAC07Rwoqx2U0odGq1YR9Y9UJRyp+Wvmflu7iUtTCA3LSiwrW36WoHtUTMoJTjg
	 AopdndTwxhDuWfDM9F8Jm0C+68V3fmCHDvW8DKdM=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id A461E274; Tue, 18 Aug 2026 20:41:06 +0800
X-QQ-mid: xmsmtpt1787056866t8cwa492e
Message-ID: <tencent_989057BAD94EB58027BF7E9528F59A458608@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+ns0JZzteoZ2m+ovoHlih6Hs9bsSfJ+vpOD0RYPBtLOZLQmATCy
	 8MTR7O0d5LH682Mrpm4ItUB4P2TJYiBqtpWGU9CG3vVlz7CoNQ4VgIV/dcxVRm6KCp+/0BCas+HK
	 WC7ocWsxgBXfXNJec0WroTxpuMHR7adfUdpn/XEbP7Cm9+luQNI/p17/0t5ZFr0l9cX2nOQtbJZw
	 80BWyKDPi7K+ibmOkNMf48FIg383cjW9uL/7QxlD6lmH6BuqintZUaCGH8lM35ZGK3gDvlmo9+W1
	 VR0QMh/pcVKr8f6WXj754X3t3+O80Fm/t166fPLpM3vx1JPRUybJKLlaloAArwV3EWhQ01y8iCdf
	 uJHMlieWYH34b+CRxZlV8r8cNhVY7qX0pqFL4p/XXGi9IC9NX7xXb3KNJqFLnbIa9rFB8mI0fNJt
	 JacfcqfV7KMjrClnAfQonS8cFRJKK6ArWW82PiobWXc1pKplGzIyUI7RA7S+frfpexBJXP3V2Of9
	 scVZT2RReMDlt1yZTijAxPuxtWMeMYAE8HXdLUMd0DkxYgxEcFdFycrybPKmJ7sajZ2GAFsHdk5C
	 ZU7nigR+TxdeEKW0APQdPeyW42D8EM4ncDW7ShgA/F3mCcJskXt7TCliUKgfqHeDmz3BiIqT1TPf
	 7YPop1hJZqx+27NzhkVtnfMMC9c688i4rfQaqtblYlCGiHQUA01ex+apPz+rvcWf1aVO4l1iE3Qz
	 vCOrIVf5Hlac2y25/t+avMYvzaJPQxGYv/XwuKW2LtP271nKMSfKwClHRvpgOdiHF8xIiDsD3CVF
	 mLnHRxD31V7AHhsrcnOuhcMbBdS54OZL8clvYmT1EihZFT7oey6O2twqhKvVlXboLdTXQNImokC7
	 x1MIVkoOzZc7zHY1jcEBIL+X8dLu112GF/NDQwZyyyMUgDsOzgyCwTWZKp0t8iE0nnWM5tzpFLGJ
	 A1T5VIMgVjAnmgVPSEZvp1Zz77FJPztBud30CH/0Hw3l/eY7OIZjxseNpO8xMHO+yZso+fT69dRK
	 8R1i18k95BE89HKPLsxGK3sTKhrvs=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Jiawen Liu <1298662399@qq.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	jiawen <1298662399@qq.com>
Subject: [PATCH] drm/exynos: fimd: fix clock leak on resume error path
Date: Tue, 18 Aug 2026 16:41:05 +0400
X-OQ-MSGID: <20260818124105.246447-1-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jiawen <1298662399@qq.com>

exynos_fimd_resume() can fail when clk_prepare_enable() succeeds for
bus_clk but fails for lcd_clk. The function returns the error without
disabling bus_clk, leaving it prepared and enabled.

Disable bus_clk before returning the error to keep the clock state
balanced.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1325,6 +1325,7 @@
 		DRM_DEV_ERROR(dev,
 			      "Failed to prepare_enable the lcd clk [%d]\n",
 			      ret);
+		clk_disable_unprepare(ctx->bus_clk);
 		return ret;
 	}
 


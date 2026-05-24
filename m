Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A63F233939;
	Sun, 24 May 2026 18:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779648430; cv=none; b=Lur/td8vDlocQjbwAH7smgf8gRTBxfvP5Iqc57H7xbzQOM7lU+GWujWxmPZg1ZR0dQr0pocP7zQFejiUAfzPTTj6WxN/UZzv3kjCpB/a4pWV38r+NykTC0Fn0DuylBJJC5mdH3uu8flIwhsnUt3Y7K+TTEdajmXZRqEBjrKJJ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779648430; c=relaxed/simple;
	bh=LCtZAW+AcOeEbyi7sL4pq6RsgIrX7MuL0JX2JoHAQiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+/e8VpCLQugAaP/afJH6UfP1XxTQDWByeiCgwe7fIdpn99JSrPIB5Vyv7qjFLfCU49QAmLDSZrA4AIgvK+dViD1BNUlqi0vLDVnQyV/CmSxRn4AeC7vUN70T4bU1IHkg98731stevEVGy73hFFHDRmyO7Zxx1oWFHSjJBTkONE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6/SYUGg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6/SYUGg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB9C1F000E9;
	Sun, 24 May 2026 18:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779648428;
	bh=niOxQJJsZUKwCVBFs/P9XxBLtyrby3KTijl8MALkwNY=;
	h=From:To:Cc:Subject:Date;
	b=Y6/SYUGgdMAnxTk4WX2Ajtjizi1Mibnv2EZc72p74H/+K7SmhWI511tKcKRpQL52k
	 CMXSNMle+279VbjGLeidDcnMfRNzqD5mUZ6Wklt1XtL5X4l0fc3o+FivBIYVWIOXDy
	 IfhOXD1fGvpOWulZo2CLHhPX7Jxb7e7CfxuMzJ7HPaJMm1bgF40hfDzzsDYphKz3v7
	 mUlw2JtdGGxAFsoR+8ln9TFk7xLwoxK2Xl76LKuZcoGhRAxexWoMSknTYHOHVpOGaG
	 kiYYtiubAJ402upToAFS1DvJOycyZGFZHb/02vrEQjgpXQCMzwScLf4CX5PI4TGvYZ
	 ca4PR30XvBzsQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: samsung: fixes for v7.1
Date: Sun, 24 May 2026 20:47:02 +0200
Message-ID: <20260524184701.16599-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=krzk@kernel.org; h=from:subject; bh=LCtZAW+AcOeEbyi7sL4pq6RsgIrX7MuL0JX2JoHAQiI=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqE0em10qaZuuG4+y717Zph3hsoxQ7QMtqD8Iqp t2on+ea1AKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahNHpgAKCRDBN2bmhouD 16nmD/4pCnIRNSmTu0pj0BC2Z4WqEtRAl+3rdcvTtgTtIjMuK7IWDO0lOv67a437yI1tTjUhNfW gZyEhKVkmVOKKtZ3+O+3DlMyZ/vbzZkYl2XnS78H6hlI7IuzvB7DkhXhCoEdXfFBM6SjLQfjvWZ HI5WsjvfDivp/flbZ9ZQBDX5NmR26YRN3YyBDR9FqYmm4jruB83PcPskmkrlapU0WeeolNOpHUa PQOQAZ6na5OKVmeFYzB+8QzZLwCtJHOGFS8v/yDqtAhca/SL6iGD7Z5aqqk6tQ1ESCyTLI1SdW9 GkzlIhDr0kEBJByIuPpKV1tJXAEmoh3S/ZCmhGDarejH+vd4UhrjD31CjN+f3vREmiDonvevh31 CvPGVkEztAlvIuAEXA8t+W86U6UyyhuhBAgGJzVMFlVCxrAp7K699NaD4sUBYqtVCX6enraH/e9 7zMrMX0CwlTXRVz/JAvK2fs9Q8wxDNWg1kGxg+V0aim8QXpirji/g27ViwJRHBH5nxcEqihwe/I /MtEMDt/EjNR/fwdIsA6DXpgGm2LsfI+0CwNEq6RD3K2mOY/xsDX50DyLnMPuc9yI9lJNh+SVMW ZCaOmPr6y6g9R6AhgvkGlkL3lXxV8LJoFOoujtPYQ3kX56vH75NhLlQh1sFrlzTL5twGcI82Jph 3uBR7XChUr7sdEA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Stephen and Michael,

Just one fix for current cycle.

Best regards,
Krzysztof


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-fixes-7.1

for you to fetch changes up to 78ee734b36284d82454e87a92094fdb926985b47:

  clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs (2026-05-14 18:48:05 +0200)

----------------------------------------------------------------
Samsung clock controller fixes for v7.1

Google GS101: Correct the register name for saving and restoring state
during system suspend and resume.  Lack of proper save/restore leads to
incorrect clock values after system resume.

----------------------------------------------------------------
Kuan-Wei Chiu (1):
      clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs

 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

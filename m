Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795394800;
	b=B2UqEXgdBsb2SxfbWnOOUIDu02EvE6MhqT1DIlVdVYhdezfgaq9vnNrjVf3+QzsS59rI
	 N8ekS9ad6bMnEnzOYO5XuFqJXmHDGQbFskmOo7ebDiVzbYK6OBLWzKneDxIf/smpHmEqH
	 Z0LFny4W5xrX+FrulOiSDhVdgKla2GqAqxGiqMpIMd5RtkWbaTCsw+et9+VRzANx/onzt
	 pmvig/m/diFB+BLBzqH6sRP3Qf22Nr89GfKDOn+IKaJdbrlaELs2BNjJdsGg7BwmyPh7M
	 QkvjmJ7Ejv+K0IvuHhxQcFsZgq9o8J1uEEEgKbTe148tV1AU9eOGyDbMZryFRdwp3qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394800;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=kwqoALvAUHoiWUrDjdoaNf7rx6mzBmQ4g0NH3zyQSKw=;
	b=GmtK9v9p0hGJXWHz29Z8sSOpBgCOjVkJeCyhB6p8hHGwtg6cknymxNc0mDxWznWffI/u
	 aG8a604vBgL72D7Rbswh5IYXU0cKRA68uuB9II64N/njRfGEL074eh5tA5NJWNUyviJgr
	 gRRvENwp3An1AyF5YnMqGlq3JNjxTlFhmujx7YmM7PNcbwgijc8HhrlLis0W/u15IOfx6
	 ++HlX+ghuyEL8+eIKXCyHtjl1pIjonTqqprpoMNSzpcoWDmtXlUKgI0PhtpfcZc9w+PWF
	 2yI1yqXjN33iXEl4s1dJtvBgm87kVh7m0Z1ppz+ucuWRKBWxwjIrI98IjCVFArapk6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DBKLzie6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B37C606A690;
	Mon, 23 Nov 2026 00:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DBKLzie6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795394800;
	b=OsnaK4TX6BjOqeezB0Y8k1vyf/xunFbBdhLF91pkk1O7e5BjMQ6OrkSqj4sYpA2HJ7Nh
	 g/jfRCq13cL5tEoQ5GCFuIzAg+nFUuYaKq4h9B7n+J4x7UOKzuRBbZT+hqfWm043pHe1M
	 sho9RiJv893oOpcpdm0AKjPcDBoIMj1iZOCfaBKWHmfB69TbVAWWaHxNOYRu/KKvsqalO
	 MENM9Sr7otpBPF86/QUKVj0clk4M0xGRt+p1yhk86bL8r4kdh/KJKk8uv3TqTDL/E3SOJ
	 re2TRDkkZMTljGMXTdDCNx9D1CBxW4pGpj/5kHvq9biu0xIqU9pnDxj/WGW7URw7FYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795394800;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=kwqoALvAUHoiWUrDjdoaNf7rx6mzBmQ4g0NH3zyQSKw=;
	b=HDcstHDGT844DaQxYI/4MId64UlVzxLkmbfvf/QjyHVdbJv5yCOwjNymQxlUskIJvtly
	 bFfA5ROVYyppWM9xeuMATC3hw0KIzbLOm3M56QL0OYjoCc3BxfBjx9W5oHWLGJJpGM1Ve
	 +9MnK0J5zfJkz5oWkHsEJL+5FBUw9gw5mzqyYFa6ZTrK4fyNU/eLYj/sUDMnzTp2/YC32
	 p5gAavKN4pQRr/1nK4sbTiumAi4DghvoPPSM8preSkFhdscAjvomvlIgSP8L+vitlNNea
	 /enE8Fp+VZ4F2z+aZvtWkTbsyQr5Tl9Te+U4eVCaYpfRVNd+ikqZ86Rof0VVy/cAqYQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3E931F000F4;
	Mon, 23 Nov 2026 00:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795394799;
	bh=kwqoALvAUHoiWUrDjdoaNf7rx6mzBmQ4g0NH3zyQSKw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=DBKLzie6lUVo4IWXAOW+p21Ja2vrYE8AHnozXy/EAscxpjINHyKtOw/cb2iZCCrHr
	 FgIqyNDxM39ZtSVBLdiPRZutt4zWhhWy8zUQufynXKibXQg90wk+jGHocDoCHdv9kf
	 iR9xBVrVVZ5vxD3GME3VDCfmd0BJu79z5hQAaHDmC4T2UFFbYKdiSJRiqTjL0GbKIa
	 eJQPVmd3Wy9gNEvRCljlscUYj3dyWEGiX0H5fFY6eRcunguI0oMHgr34kNTBTBjonU
	 Rd8i9o5E4016kWju3EHCIhiYcbzPImcux5sPn3Isi/coq9eSlIDgri33zdeQE+Q8YS
	 DJ2hiTT2NuHBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4EE2A4C276;
	Mon, 23 Nov 2026 00:46:28 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 00:46:28 +0000
Subject: [PATCH] firmware: samsung: acpm: Don't use pdev after putting it
 in acpm_get_by_node()
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOOMA2sC/yXMQQ6CMBBA0auQWTsJUwyIVzEs2jrKmFCaDhAI4
 e5UXb7F/zsoJ2GFe7FD4kVUxpBBlwJ8b8ObUZ7ZYEpTE5kKed3CqGh9HDDOE7obuZaa6mqphlz
 FxC9Zf8dH97fO7sN++m7gOE6xNCuvcwAAAA==
X-Change-ID: 20261123-exynos-acpm-put-b81b91734a16
To: tudor.ambarus@linaro.org, krzk@kernel.org, peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795394787; l=1475;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=bChsoGwuOPp0ZcQo4sMwjJk0mSKlHPd8ZsaLm0M8RC4=;
 b=dlh7WxPdsQpKUOCbkeS09eaORPYYJsWQ32yurBgjgsxUeyfMzWXuLHNHLFAClztR21aOZnvPM
 egBpPS8BVPoCjv0hliZYoEw/AwDhzC89wp3oPh2bTv7J+55+XXipdwu
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

When device_link_add() fails, acpm_get_by_node() drops the reference to
the ACPM platform device and only then reads its driver to drop the
module reference:

	platform_device_put(pdev);
	module_put(pdev->dev.driver->owner);

The reference from of_find_device_by_node() is what keeps pdev around
here, so pdev must not be used after the put.

Drop the module reference before the device reference, as
acpm_handle_put() already does.

Found with a static analysis tool and checked by hand.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested on arm64 (W=1). I don't have the hardware.
---
 drivers/firmware/samsung/exynos-acpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a575caf871b9..15d2f708b0c7 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -816,8 +816,8 @@ static struct acpm_handle *acpm_get_by_node(struct device *dev,
 		dev_err(&pdev->dev,
 			"Failed to create device link to consumer %s.\n",
 			dev_name(dev));
-		platform_device_put(pdev);
 		module_put(pdev->dev.driver->owner);
+		platform_device_put(pdev);
 		return ERR_PTR(-EINVAL);
 	}
 





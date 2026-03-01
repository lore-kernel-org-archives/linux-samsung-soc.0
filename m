Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B33E26D4F9;
	Sun,  1 Mar 2026 01:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329981; cv=none; b=Ii53Oo1ww36b8T0NFbml7yI1amJZ+2v8SdjzpI/8nGyboVYhF0MbqIdyZD6jrA1E1IpsqUCdIDwJknOf5GBqqjMiOKN6JWkKQrHKnGWgCrkQ8ZkvT8IIm+dgpnb6YfmOOAEqe/XyBrclUPsfz3fBcT5cEx89mmZumnAXtkSiw6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329981; c=relaxed/simple;
	bh=dRiM/jMq63CqjnghMz7kY/a3is23bLOBjy69MzwgtEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pKl8PhRYGl5B6WlqdCZQ5uEd6HVLrApXnpPbyQomYLumhuTOFqv4si1wLvonr5q/TfkI+MiLqh/kl6cUJh2fQp6WyAzQEZ4AOf4oZNzG442pQ66RyWq/c6tPMJq72b1qlngLfMMsbZIGr405VOHQFtpgFBzYKhL6/1lrkYK4jt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RipAhqhE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RipAhqhE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647C3C19421;
	Sun,  1 Mar 2026 01:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329981;
	bh=dRiM/jMq63CqjnghMz7kY/a3is23bLOBjy69MzwgtEY=;
	h=From:To:Cc:Subject:Date:From;
	b=RipAhqhEjPRebsUg5qOMbOkms2XbdcDTfDj0v38aTueHVmnSMNogaS1drjMgFDMyh
	 c1Vn6RdrfYFq7RvJg7UcLwkI3ZkzxFWgecWXWvuLy0eoCvfMMDU7PrXg1je6Mc4sYY
	 cZY7AqXIQyKrMLR4DDreN59aF/1In5g1tl5fW7rpysdQ834A4SUyI+j/eAhkEVWdsi
	 DsgEPlGDX8ziTFdClEjL8qi15ImnAdT8BDQsT3ckYFy0WJmyUy/IGhvimuJwCIEEDL
	 9tPGR/IVYnKc2t5P2hy5iHkO8yf2gwxRVlgcHoYjcQ7UX1UA88glpJk6bVoX4qL9gA
	 IJcUX3f9V36Sw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	aha310510@gmail.com
Cc: Inki Dae <inki.dae@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: FAILED: Patch "drm/exynos: vidi: fix to avoid directly dereferencing user pointer" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:52:58 -0500
Message-ID: <20260301015259.1719632-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From d4c98c077c7fb2dfdece7d605e694b5ea2665085 Mon Sep 17 00:00:00 2001
From: Jeongjun Park <aha310510@gmail.com>
Date: Mon, 19 Jan 2026 17:25:52 +0900
Subject: [PATCH] drm/exynos: vidi: fix to avoid directly dereferencing user
 pointer

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 480c99a8f9f75..9709c07e5d8f4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -252,13 +252,27 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
-		const struct edid *raw_edid;
+		const void __user *edid_userptr = u64_to_user_ptr(vidi->edid);
+		void *edid_buf;
+		struct edid hdr;
 		size_t size;
 
-		raw_edid = (const struct edid *)(unsigned long)vidi->edid;
-		size = (raw_edid->extensions + 1) * EDID_LENGTH;
+		if (copy_from_user(&hdr, edid_userptr, sizeof(hdr)))
+			return -EFAULT;
 
-		drm_edid = drm_edid_alloc(raw_edid, size);
+		size = (hdr.extensions + 1) * EDID_LENGTH;
+
+		edid_buf = kmalloc(size, GFP_KERNEL);
+		if (!edid_buf)
+			return -ENOMEM;
+
+		if (copy_from_user(edid_buf, edid_userptr, size)) {
+			kfree(edid_buf);
+			return -EFAULT;
+		}
+
+		drm_edid = drm_edid_alloc(edid_buf, size);
+		kfree(edid_buf);
 		if (!drm_edid)
 			return -ENOMEM;
 
-- 
2.51.0





Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C0933D4E2
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 01:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435249; cv=none; b=mISjAW4wJKevffwlIC5yYqOHRmlOtUNiZugKMb6/xHq4XlC18dgx5hAJWOmxJfAwXPvnQpL4fwNiOBNsTV1/qZqI4bw0SM674HstxjjCzm6okfX+IbmPaP9mRTyDV2qX5VOwWfflRqZGGLqXkh5/AAU1/pTSRxuC7gh8U7MZRuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435249; c=relaxed/simple;
	bh=cSt7jQUGq64ZD/zrBvItYaOU0WRDoEfcG5mlUjJSbrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oh4crdb2YJvzSaN3kVO/jOPGuUGX0fY+a0gMU44DLl2E2xTIk0nFTk952dAmHxISvY5xR6oCV+G1GZ/+ghNHeWBMpm2XNyLRsfN2nCAThy6D6woI4WUZFjajw6vA1IyJhlY/UcvkxotWWujN6SYfoibvWP9ri8SRt6d7b0e5zJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfcC+YrX; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfcC+YrX"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90cd4631090so4674346d6.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 18:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435237; x=1790040037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmgxL+YzDrrZHo0jFAYUF9npAPr+/wsk6K1vfZ01BB4=;
        b=RfcC+YrXivdXRHIpt5VoSMDzj1Ea94+c0Cu2S05YGW4cJV4EhiBzwroLjL0BnPN4wM
         f2E2RP1VNZpwHT5XuCWXiXU30/LBxVtwpSoZpXg4sWOr6rq7SR7VC/+Dw7iAP245UaUY
         bb43GOcdPGhenirAnPEqQ5IQekysDQ15/vv3lIqOE8L0lILS1nk8NX7NO/QloQuyYbqS
         F5UDQLh1phEJojodbvg4NDEOicB+X+75/AgJCR0xYeEz4YKK9lgQTFZRwlNJnPtli0lD
         jiUkgRPwgUJrd1GpYVwt0fX6RsusdJXE/dl+8MizIZN5jCkpBE697qDExF5IJkvLZp74
         R68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435237; x=1790040037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmgxL+YzDrrZHo0jFAYUF9npAPr+/wsk6K1vfZ01BB4=;
        b=U85cwum8AAVpfcqUz2kptCy5cyh4tPZAhjwBq13ovrcyXChxJJB+9DLZO8KBkf7kaB
         IphoB0T54+LSd/0vh7E8hNeoFEpUZXifAHJzmDecz8Y/pcwALDjYiUe4hMV+8nvL1gYB
         V4QpVrvQrr4+y8jhdHwB0R5lY80Rw30lqbNZWU18a43Cl2amSH//XWGYlAgQx7CjJK7p
         cuXAOY+y9Xtl+SxCJlqHXRQUsgA3bADeNOfrbCnLSe4P5v4MpD0pBXOpHJIdsRoST/U2
         JOrxwzWmHKnzLFdCpbZgn3O76PH0dM6yJ1zieR+BbcgbiBcGvTXalkboKoKuO+B2WbxQ
         Vz2A==
X-Forwarded-Encrypted: i=1; AKwUvByaBK0YI8Y+bgCHphTaKcQCVbNthbTlmzhkvKc0nSJI9WAwlaIcJUS1xErn7pU5MKpG94pYOlj9y9pKlECDRdCb4g==@vger.kernel.org
X-Gm-Message-State: AFuF++kVC0+1isE9EaS0vFKNQ9qSKdWYyO0S165qUK29UrHkqwIUTnSR
	xivKoU3SF5enJVo9bIbH7+5M4ZGz9BCJPAJBRV/BhQefF1kHFMwVDvA=
X-Gm-Gg: AYBFou3ny4cCYcl/CQnPbq/Kmp3CAhs6PINacJaZwwMuPAjDs6UYCRRkQG2j8VVIPvf
	CHihNBC4jXAFU8W+V5i+10ALhtE7oJ+EC02b0MonV21WiJEyDJMxoumCjYV2PHa0/doMIz/ZTLZ
	psB2+pJ0Hu+EqXPEDgklYUAaQcWTLZgItDzsIHy7RfcSOD5Rtieye/CoGz4J/K6An7N06Blr0aG
	kWYzWp8QwpoUVQfCiFN1ZyLWNeNXNFbXUkaCpOPBSCec9lz7riVRqkLE9/JR+EE3TwskvlYqQt/
	+vGAmVr9f9+R4O9BAt2LSINwCjZH6s11tPkrFUPTVFqKlw3ILw1SxnqyzDO8UUvLMN//GAR6Az0
	iinTJNCp3SyDBHxDJbADVFVyPsQLz0ejjn1NugAvOvcQMV1ng2ser39k1aR9HsX7u2qQ6yXjsQn
	ITklRUWzNFQEGfR2X2c07YFG4Y7icYGZFGD7W+0X18mUr0Rok86d8HB3PctdJtb6XVx66m+f+4i
	AwlARCueic/MaF4eyb+s5lVPIi1/X5c7WcZm7aPjjyShycnEUAb+6E8JfJouQqNAdbiwwG+kyYQ
	NG7Py0m79Pu4QJumXkmKvGO5eRI72hpohND0d56y+hlPxvmXND9CoyGE/+jFoJCmZ7Zr8g==
X-Received: by 2002:a05:6214:4383:b0:910:42f3:958e with SMTP id 6a1803df08f44-9123441de5dmr26302696d6.27.1789435232163;
        Mon, 14 Sep 2026 18:20:32 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:30 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 4/4] usb: ohci-st: disable controller wakeup on removal
Date: Mon, 14 Sep 2026 21:20:11 -0400
Message-ID: <20260915012011.61874-5-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>
References: <20260915012011.61874-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe enables controller wakeup after the OHCI core marks controllers with
RemoteWakeupConnected as wakeup-capable. Removal does not undo this, so the
wakeup source can remain attached after driver unbind.

Disable controller wakeup after removing the HCD.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: d115837259ad ("usb: host: ohci-st: Add OHCI driver support for ST STB devices")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-st.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-st.c b/drivers/usb/host/ohci-st.c
--- a/drivers/usb/host/ohci-st.c
+++ b/drivers/usb/host/ohci-st.c
@@ -235,6 +235,7 @@
 	int clk;
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 
 	if (pdata->power_off)
 		pdata->power_off(dev);

Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D182C15B0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 01:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435237; cv=none; b=shrqC3PO0hZNzRRJaXhko+oqm3FZ9wcP5xhUBwekJqpL5r9Q5K2DERGqWtSNcmQqQUwF4w8d4nBHyNV1ipcxNcKO6Yz4HjyNsneguZgsXPxDE86T+fU7JIe4N47qkBPpfNELW/LKEiKvW7eKiqBmavgcLMlLQAEKX0YbwyrAeYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435237; c=relaxed/simple;
	bh=CLoTbPNnFD7Nf/FWMZIj87k9uF5C+XkJTmib7IEKVno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbJFafZGP8J4LLMRZ5vHQd4ATeLmkdoEOsHOlLxLbV3wOGa55sAgqAPMjFg6HJtHasBPjy0f6sSYHUd1Ja1Hypk/mTs1ERqef9uSHv2vev/aJRjBPk983dTNMSwxO08MT/Jt5syzncQ2LCECW2Aa1LS3Zn09+xHKgolN+d8Sv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShV9fepb; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShV9fepb"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e28a62abso43001591cf.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 18:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435235; x=1790040035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFEVv4dcy08X3Ik3HgrSf1qU8ho0jjZ5Mt4Ngu5dZIw=;
        b=ShV9fepbvFEt7PsSbtz9Kgr36OawT7b4nCoXUE1Q/1mlyb6DwMiztcZHRrsVE3cIYF
         eoDx4g+SczJajoG09H8Y+nwQK9Z4lFYgg509zY1mA78o0Vq2YriFJV24K1GO4rChrxQw
         etzoH7aGsAkHDpfb7zVpM1g3AR46F07hNuI4/y78LHDidVdjZtYzwVSX301M9OVnUiqG
         FYVyltiTc7zKM1z7BDP2nU8PnZ9FxmVSASysS2woWi3iK1ygW9Zl+dikM4ILgoqaWfsI
         wTLZJqEfPd3yOXCGtoQYLUil4U6pk9kJysMkY4f/hKS46IxXRhnw4UfkrTuZ8YscRITc
         V0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435235; x=1790040035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFEVv4dcy08X3Ik3HgrSf1qU8ho0jjZ5Mt4Ngu5dZIw=;
        b=FmvxoznZ5eDZ2ViqmEkhm8XCDqZMwjeqGDSrH6OM9q28iKLYB2xGa1On85RgIw1AcG
         ywJODN/atbayR2Ljt0/1rI/ewHDzRpIG/YM3XJDFz3XVVY56V5N18NXfqiz6F9JPXbNv
         pNEnpzwKNZ/4VWzZVmCo1H8eD3//l5IDTQkOAFuQ4rx19O/JLIbVgSRXAftlAQ5mt5N5
         ctmI9muuoTwgGTFqltjL0tKVCh3m1fbmTZPNsh3ah6dvbUUmEQN6RPBT17gjsqFznfsm
         h546Mbxsc3bjElgN0UZNEUhyn6Z9jdBp/3/Tde4thnJ/5mm1cwo2tYrUM8ZKT9ZSO/4o
         L3+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTnl1tGPCsztbiFfHVC7lRX5RWnO937jeoaDK8wzNw1s6POZGxMYHf1ewQxKgBsz+DNVusY9tOOeXr/aHWfmdOPA==@vger.kernel.org
X-Gm-Message-State: AFuF++no7sHxJHamGgzg2QOUh1SGv/s1PZtCRUF3lN8K3R+/pHlzeYsH
	Egk2vEpoyEOOu7lyNX8riJLCkBGW6nlogJKua5wj2DUUoQfKXc9fB5k=
X-Gm-Gg: AYBFou1Oq3Dg/Cd+GflSdMLQEpK/frbAv1BWY0QjSgOPDPzTZPbia2yO757LXvx93wl
	w4YzlNjtiQ5SS0TWp1MIawR65OoBpcsJKlYbfJVfATJSkRWi30zPMfODlPcqCfDRp6DaNO5uqr7
	8+lMpQgRE5lT+h+7PZAhoACVdGm4lSf3LfUFq0+PUlzPbKbGel01teNP9hA+XHGRqBZleDX5pRD
	qiPC3MidFVfY92lT8xTS92QvcTakNnrcd+CKiRdQibhFKHcRcXe/WZ4xecE7HtcAasBVZm1CcX9
	dhdEsUNW0Axt960yRla73zNL34lVm2mg2EEgb/YwdiiRGKzlKuRmL+5LnWqHatgEg8/MLdkrseB
	fs08yhXJ6WWNmgTSTtoakrFtJbqln10w8hywtEKZajiwbsT3kkJ/OzyWVveaYDAEarsh//Svfbx
	cQJKDcimumvCOfoz8FtLAZ0ZgvodRpPBI3bnPQhhSdzvGlz7S4AFbbyUEfR3LVka3KlHF+cW/e/
	3bc8VfloWuJxO0dRcbfOphaqZN/MSzXOIU7CoxcxweVtkX7nkON4cd9YWILumykEAqe6QklcwlM
	3e1NcuaxELmFm7TLRKll8roYTel5jwQLVVM9YeBeusw89s2IIlQheH2e8nnbaZo5tf7amw==
X-Received: by 2002:a05:622a:1bab:b0:531:164:fa73 with SMTP id d75a77b69052e-5310d0005camr81499831cf.32.1789435230101;
        Mon, 14 Sep 2026 18:20:30 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:24 -0700 (PDT)
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
Subject: [PATCH 3/4] usb: ohci-spear: disable controller wakeup on removal
Date: Mon, 14 Sep 2026 21:20:10 -0400
Message-ID: <20260915012011.61874-4-mhun512@gmail.com>
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

Fixes: a6eeeb9f45b5 ("USB: Update USB default wakeup settings")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-spear.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
--- a/drivers/usb/host/ohci-spear.c
+++ b/drivers/usb/host/ohci-spear.c
@@ -103,6 +103,7 @@
 	struct spear_ohci *sohci_p = to_spear_ohci(hcd);
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 	clk_disable_unprepare(sohci_p->clk);
 
 	usb_put_hcd(hcd);

Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815713321A1
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 01:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435229; cv=none; b=MOI8/qx7EyBurCHVtpwWOsP6VMtZLGgxKL9IMiKbh2ee8LwYxHvihFJHNNZ2Ycy2ZEmuj3MBn+55G6OinPw2XiVosOzSAii0jLc7FwwLuCl4v6J4iJBR7rl7fq2kOruMRjq351i3iJN6EdPJqqSO9oEcDlgxpDZOeoqE0QAURcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435229; c=relaxed/simple;
	bh=zLBagadYIkgHnlxLvmsxj4cwyFqnUnBYuMtGNS57J5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QHqDkvvWJ6PCmUiJI45X8Z7nRJNuHa2fL2DW4L7ihevJnKqWL/Kv1MgfEy760kltlzIAma2mF+/hS4NiSjmJW8If1shE2Bl7eseZHHV5LQq2edFxvNhcAwpVfA96UTMFM+A7ucVu23tT5+qrhPHXno3y/LZ3wn7atgF4FBpSsiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=so5pRUUu; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="so5pRUUu"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6e3so36966236d6.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 18:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435225; x=1790040025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HicEH3nO+EqTxA/vkVDZn60ZwfdK+A3BWy3aE6/nD5g=;
        b=so5pRUUui4UMGwIJpCv/Xg+WGsPPiNKg2Yov0YqsfNOH1sX67dDlhFDA+/drc1SzDe
         GaPQ8ZMmqOJoyfKrF+HGOX1mM5cq6QMxiIjF/7fs9IWOz9HmXNyp1I8ZWjfL6cbd+0d0
         k2kWq7YA2ahXIO2hDn/3uyZwkxccesV2+DGynIJc+KyYMYq/wid3oPi9wA940xDCEl6c
         Ev98sV+xqmcxn+FwNwWUlRltgtsjMWz+PPQ6u/y4XOd0yu6X1QTlmjKaQMTA548WkBhy
         JIff2vCyNfG9Fycye7/+aHwDTt2yxToHtzL8yfFovTWrLk4mHUzpJ6T+3Gd1ZSF/f9wK
         fWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435225; x=1790040025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HicEH3nO+EqTxA/vkVDZn60ZwfdK+A3BWy3aE6/nD5g=;
        b=ub5U0ZXtaBy8Gt1TdZ5c+IJdegZG8EmKZjMlEfa0vVmvMhvgC7ml/xvavAPXpE80Yn
         fN/P+L0zu2h1BNnM7SbUA7jCFtuR/Ub0w8piKoHGrfW0IKDTrBkAwUFV4nzFO51Rv1df
         EVnaR8BNIsV8QACk8oXN8gT5zgKOYg4LFefSPVbmYoGgsQboVTBCFBdCf2r0ODXSbCKN
         XlNP95JE7CG6YKbV+4Df4or5wlWgkTdPJ2HxH4fWWj8BIpIB7XvWfX0g/+gVLfwvH9kZ
         ih15ejDsvM2VTALO0Z46CvVMuYFH53sSXGzUYw2cDyyMjj2EJAu9dXLsCkRrbwOvaqq/
         iBOg==
X-Forwarded-Encrypted: i=1; AKwUvBwZjnUlOImxTCpiZuQEpNvW21sl1vdw9+UmKozkYgcESV1rN2gTBzTtmY+jc6K1HjYNpwtBJeV64y72m0ex46Vtag==@vger.kernel.org
X-Gm-Message-State: AFuF++kH2EUe1XrCKQX3X83s7HvCwemsJvRjj7SdRsvrzcbFmyx7mMou
	c9oZLK09CJ7xgDRMmfVQuYebOjIxw2kzjrxqdbcAcXLGwPcMcG2UkX8=
X-Gm-Gg: AYBFou15aAzK9vSi+eKGvR639/QdaffWLg7Q1M0dSAAT7f57t+xhPV6NE3eElvSyflt
	BoBOqdRhuc+oYttNz8CP70/a75jfiue+v/D/PBjaOhIqbAyIEDmRfasu1r96/YY97PvZ5zwnN9L
	rSSrNKE4wKy9aCnK0wcf0GcNbCIYgHW9+y5ANGRgYMizxPetA1VC5O30fUqiPcMlIXrIoQIEcgH
	vzzl9IJeUcLoXy1CU9diVAXL6N9f5lFwmg50vph8jTDmhEFnMez5gu4tSR+uMI1IfHTuE/T26gy
	3oDGDCm8XXDXjCIBe7LFCtuRz0CJPc1WPGAycR2oOcBn4Vpdep+H0jTL4f6TGro6f/nOnschcxT
	Frwc/dp7BDmjsVjAdDCmDg5y08yK+dwDiS/OkvpidmSlHzeKGZAVmWlYC4k0aUhOKfBcuGt+rch
	M/lV748QmL9HecdZKWyqCdRr4gbrLC1Vi6gMvGkhPbJQBHCmbfZaBhbLUGjHXbB55PbSs+P+K4x
	cG/kixWjKWIc71u8qC9VrrRCTHLacbcSDqero1Fzz7Ke3D4otcFfsfeRO0IIkYk0+yNZwm5RqHd
	0ZlmZOEYxLlZMM+7YNpFOyFz16yBIqpJF+53WsIjyg+Ek5KirQlNUN+XQKOArXZ530pzbw==
X-Received: by 2002:a05:622a:4c8:b0:530:1613:e09e with SMTP id d75a77b69052e-5310cf14c2cmr70974781cf.1.1789435220207;
        Mon, 14 Sep 2026 18:20:20 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:18 -0700 (PDT)
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
Subject: [PATCH 0/4] usb: ohci: Balance controller wakeup on cleanup
Date: Mon, 14 Sep 2026 21:20:07 -0400
Message-ID: <20260915012011.61874-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These four independent fixes disable controller wakeup after HCD removal
in the DA8xx, S3C2410, SPEAr and ST drivers. DA8xx also needs the same
cleanup when notifier registration fails after the HCD is added.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Assisted-by: LLM

Myeonghun Pak (4):
  usb: ohci-da8xx: disable controller wakeup on cleanup
  usb: ohci-s3c2410: disable controller wakeup on removal
  usb: ohci-spear: disable controller wakeup on removal
  usb: ohci-st: disable controller wakeup on removal

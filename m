Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0055370ADA;
	Sat, 10 Oct 2026 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627340; cv=none; b=dm5IfXo1x9SrNrEPfpI/NKBN9i+sDIEKO3Wjw7hgo6YXJyPR7xNKuNACVKU1TXik2tfo8ovEA7+AKh6XpS/BTQ3Hqqv641mO7A79419fvzhZRV36FKbGelpNzA9yKO2PsfAvXOBAfYE3yJjvxbxFUjeL2l8paA/vtdbHzkq9OXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627340; c=relaxed/simple;
	bh=CT2wcfd5eT1AjNUmw8ae8nmJnk4euJcJ+Oy/84Q/nHI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=VxeE8bwlqqJmCZ8sN1ZKkYbE9HdidP/1X0AaP7Hw4hej2OufsDqSkQcm3BE5ST/KTuLby3L+5CxsxPMhN3IMdMCPkFhY/rHMWThB67GiD4PLDcyFg6njHRNFpWf9bLT6ahf4Mk3LxhS+9Xs8/n/jmOVyCMFl/YulH7Ac+l5hUYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=OXwxxoJI; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="OXwxxoJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1791627330; x=1792232130; i=markus.elfring@web.de;
	bh=nGVFAV5wDMLh0+z1oQnfaJgCHGbiS8UnILd+HMf9YRo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OXwxxoJItTyetcB0pIAZP3TQHuGbPLZ9A/Z36G1SKUcOQqVbF7q4A21SdvtprbVf
	 t5eibt1N/VZt3Ku7bLyn/18/dANgL3fHC1kcaBokaahFGLTZZZmBwigpW2YSbHZym
	 PTXg3/ZIydH46TkTGo8DdKJWYi9puF3iaSnsykURHy1djXGiGZ0e70flov1dv9Yf7
	 TqloJM1NPdf4Lrr8fVqIrHIbAFjocimiJOfs0Mfxc+S4F3spHSdjn/sJaFELcwQfF
	 AcRuKx6QkQBlA7YaKb2ohK2Xgk/FIECcK4IbdNG0du8Nh1KHkrCfEdfHrcIZZfrEu
	 qgKVap3RTxduqgkzdQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M9qd5-1xLFPb0jp7-006Lmt; Sat, 10
 Oct 2026 12:15:30 +0200
Message-ID: <9099b92c-d456-4dbf-95c7-dcb3f1004066@web.de>
Date: Sat, 10 Oct 2026 12:15:10 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Douglas Anderson <dianders@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Brian Norris <briannorris@chromium.org>,
 Joonwon Kang <joonwonkang@google.com>, Lucas Wei <lucaswei@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Subhash Jadavani <sjadavani@google.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
References: <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox
 driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K+UR+Z8X7vlyuCDoox+Xlhg7ghXE0THzJ+LtDCoFNfVMZ9/mlMi
 zTRP9QSZyKVp0QEmVZdsybpzKcQl+Zkdr3mwm3KCPm4PXAL3Aqa3+n/W4Yg+Y149i4mIgg5
 K06PDEc25NUg8WmzLeWy9F0J138vQ7V5E9o+XeZCVKpMefYM4554ULZuVD8zYYPtip5WET7
 Q7NBastEvefMwFvk7fMQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JNQ1aABJpnY=;/mBywpvpOF9d+PvXLVkC7vqY7+c
 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

=E2=80=A6
> +++ b/drivers/mailbox/goog-mba.c
> @@ -0,0 +1,567 @@
=E2=80=A6
> +static int goog_mba_send_data(struct mbox_chan *chan, void *msg)
> +{
=E2=80=A6
> +		spin_lock_irqsave(&goog_mbox->lock, flags);
> +		out_of_space =3D payload_words &&
> +			       (goog_mbox->outstanding_msgs >=3D
> +				goog_mbox->msg_buffer_words / payload_words);
> +		spin_unlock_irqrestore(&goog_mbox->lock, flags);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&goog_mbox->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v7.3-rc6/source/include/linux/spinlock.h#=
L642-L645

Regards,
Markus

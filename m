Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AB5282F24
	for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Sep 2026 01:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788657639; cv=pass; b=upv+/F8533vQlaUpnbmIC0X/h+6NyUvBuEmBa8Rh1mYZB0kSMg8epQpY6cN9Sl4+0E9SGWVKCciia8RKvk9ifzcByTuAKVHGbJf8/za9uTUEHlEW4etkkS0ybnO0AxuzJT+nty3GFQbXi9SWaWB/2KV3SUfN/AzZNwzbGVAsGjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788657639; c=relaxed/simple;
	bh=VcpjacYfNfPXypVCdkfzz5uNjfBEJ1CeR+0zgePQPwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qm/fIdlULZVKz/ln6sWxdoMFfYtiSauL86vL1jhAENP+OTlA3q1mzct43QZhqISfoDEIxvAxXk0rJWlqhCYErxokAJrdjDIe5oiFsE/22eoZMKkhUa6p1HI3yrJeBIugBN8tTYrLG0DlUurVsC6/lgSmLGPaDmn2ZmpH2/kHl0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXzGTGI2; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXzGTGI2"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f4dedd67b8so2132853a34.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 18:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788657636; cv=none;
        d=google.com; s=arc-20260327;
        b=LY+zlfFQnlHnt2K6V10OxXz5iCjdQqsM5XRC+2g9a5cCZ9KI+H/qjmwz2iEY/iwD57
         bbfl11an/X7uC4C7BUe3+NmT9O96iaQvo8jyAQTgcXxgrrtSQjziXHj5+ZcYoUyc54W1
         ct8kihQbaTp8D4BRLkld+AbU8oSPNT6d1z6Euix1xKBktxoknIA6/B8Uug4YHIjun4Sj
         PAur0QYip5qGq0iTcxeaC8QvNHHTREOyVcG7Dh3l5RA01S8/pyFN4CpBzfdPmAJ2wARD
         xGg1RY2w0eV7HEur8+S+3b9UUb/4QSLTqQTlU91qRyK2l5e7muGQQvEVoXBjlQiswEv3
         JhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vrbIhRjPzei1dtqxq+ZD3mi9kwyuQdOPberv3S+Q6ak=;
        fh=Z0wSLt5RCbd3sqbZsv1yRcTVPrNoHFDpzVC0gYnl3u8=;
        b=opS9j1xgKa8X+A/V1fh/zywffkxG8fiW4IVoUWqBWb9ARANulbUqc5xwt5wGY+H8vt
         FY7c9SYaO5CfG7G3qHYEBdnXbnzIK/LpRZVmG819TVCIUjFPQ/zYSjCJ1TGgXjt6HFza
         tex5fjlqNlaXgpUKeSLQnW8+ErtO4PwfEdrmAW+pgdNJTslSyTFgG+rgLskLthX2CBaZ
         iTVAOq7XXx67CEDNyb3GVEagohoViDNuX2RQS64UuQwTcYjq55qY2DEUO2W9VdDs4CbU
         B0QeHgg2XiYuZ/EK033ZsIMGpRfsz8W+/OMXzYZVqQ6y0xUtL6QpwZXVY70q/MZA4K5s
         e42Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788657636; x=1789262436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vrbIhRjPzei1dtqxq+ZD3mi9kwyuQdOPberv3S+Q6ak=;
        b=sXzGTGI2TB3fZVYsMhUSBDxnXji72LlqgTByeqjUkFl04ltxHaU6m6qpJ+rSHXI0s+
         UWC8OtU4sGQQ7vO5WpHRT4iNnWengxXwtTAVoiGWD+zvnVPnnEGS3wxVjwoo2TayPZY6
         jHyZmE157KQajQFj8q/ppy73iToc6mxNrrkozsiqumnVZ3v31Bg1h+HPkiExFsYDRsMC
         HR34cN5DiHmrEWuOajA1lnZ6zh73eNRQeXzwUYfKHxOWPFycRbvMx0wHqmyzbd5vxMLh
         oO+CR8FIvzIvt5sZmDCm7BXSCAb2+q/f5WClmXEINRTtL4Sck9Bk4yUhToEY/OVDKTyF
         hi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788657636; x=1789262436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrbIhRjPzei1dtqxq+ZD3mi9kwyuQdOPberv3S+Q6ak=;
        b=US5UZFUHU+TZmAaaMG6oaHJMTM70Obi49CYuVjmCLrJGoJc3GVbS4dZP2qNh7Ssd7k
         WhGq0UajDeKQOw0uL1yq/JulmrZRjP3xfvECG4pvyebSIFmWuOfGCwvzy8UAIzcuT/eI
         gdgnP8BMWBOJrtNWxkmy5WeY+FYiWhzexOWlhEbEkc5gveTPP8CO0jZf3b2xDOais+GW
         HsYqrooPIgI2R3ERk268ttOvCqxfNon/+POkImidSjlRlra0axWyXRY3xcyZIaYFJ6KE
         xrmV2tLZYubNpDwaZst/qEHHbRO03Pee+GN4rpKJd4ou8c/0rkhEiEFmP2xMDpbrYF6d
         3TWg==
X-Forwarded-Encrypted: i=1; AKwUvBx7zPVqx2rqq9Ne7iHkJpljqCAExSWAPbfIuRf7gxYPJIwDk66JFbrhvkEnxFeQT0mn5kusQUcrSjzUbB+iFAgkag==@vger.kernel.org
X-Gm-Message-State: AFuF++lPx1ptVTKT6sHFSqSAyX7R8qM4DgQnsDlH07zIRbirpf9BJiZ2
	amf9Bh7fAUBpnQdIYzmjpimuyRGW0oS6Nh4dTe8FM1vnl0UNCv25KWBfae8UK7jIznbjqk6fOQA
	3dwEpTq4tZFVwwLPn01NxgIQKxZXeXpk=
X-Gm-Gg: AYBFou1LiVyUo3UTHjSHl5asMF52XxARBzdgt0Eq/pNDQy6OZbW8PMlJBf98ewL61Od
	H21KBM7+ylahmgz7HAlHCeJVheEEe1fWJuqJcmsDXySwaZgxeWkMOBW0c4dwzz2JZ9GAnihpctv
	AwYKaUOm/88EbL0pEsmY6rSPgjr29N8HK74WKHUiJCEztPCXTklNNipKAh5VpjahSQdE2wENPC2
	VE7/XwOwx7HxwsUehGMhwPknv0eoiv4ExuQE6VGZM+7w8KJhEVfGnrxkwYCEmr/t8+mEDyfWEkd
	FauUig5Q6FO/cbZv8zQOgs1/ixP7wXyvp0awhMzSh58/sspcbxP9bTjh
X-Received: by 2002:a05:6820:a28c:20b0:6ba:2927:3661 with SMTP id
 006d021491bc7-6ba29273f2fmr202772eaf.18.1788657636529; Sat, 05 Sep 2026
 18:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org> <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
In-Reply-To: <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 5 Sep 2026 20:20:24 -0500
X-Gm-Features: AcwNN1W-1EM5u25I6sIYjSAHidxk9uQmu6rjm34oWnomns496rRML5lm1gN-HB8
Message-ID: <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Douglas Anderson <dianders@chromium.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Douglas,

On Tue, Jul 14, 2026 at 5:24=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
....
> +
> +/**
> + * goog_mba_handle_tx_interrupt() - Handle interrupt that remote Acked o=
ur msg.
> + * @goog_mbox: The mailbox info.
> + */
> +static void goog_mba_handle_tx_interrupt(struct goog_mbox_info *goog_mbo=
x)
> +{
> +       unsigned int reqs_completed;
> +       int i;
> +
> +       /*
> +        * ACK interrupt needs to be cleared before reading CLIENT_OUTSTA=
NDING_MSG.
> +        * Then if a "race" happens and another message gets Acked after =
we clear
> +        * but before we read CLIENT_OUTSTANDING_MSG then the worst that =
will
> +        * happen is we'll get a followup interrupt that will show 0 reqs=
_completed.
> +        */
> +       writel(CLIENT_IRQ_STATUS_ACK_INT, goog_mbox->iomem + CLIENT_IRQ_S=
TATUS_OFFSET);
> +
> +       if (goog_mbox->queue_mode) {
> +               u32 outstanding_msgs;
> +
> +               outstanding_msgs =3D readl(goog_mbox->iomem + CLIENT_OUTS=
TANDING_MSG);
> +               spin_lock(&goog_mbox->lock);
> +
> +               if (goog_mbox->outstanding_msgs >=3D outstanding_msgs) {
> +                       reqs_completed =3D goog_mbox->outstanding_msgs - =
outstanding_msgs;
> +               } else {
> +                       /*
> +                        * The hardware's track of outstanding messages s=
hould always
> +                        * be less than or equal to the number of message=
s we queued.
> +                        * If it thinks there are more messages outstandi=
ng than we
> +                        * queued, something is wrong. Assume nothing was=
 completed.
> +                        */
> +                       dev_warn_ratelimited(goog_mbox->mba->dev,
> +                                            "%pOFP: unexpected outstandi=
ng msgs: %u -> %u\n",
> +                                            goog_mbox->np, goog_mbox->ou=
tstanding_msgs,
> +                                            outstanding_msgs);
> +                       reqs_completed =3D 0;
> +               }
> +               goog_mbox->outstanding_msgs =3D outstanding_msgs;
> +               spin_unlock(&goog_mbox->lock);
> +
> +               trace_goog_mba_process_q_txdone(goog_mbox, reqs_completed=
, outstanding_msgs);
> +       } else {
> +               reqs_completed =3D 1;
> +               trace_goog_mba_process_nq_txdone(goog_mbox);
> +       }
> +
> +       for (i =3D 0; i < reqs_completed; i++)
> +               mbox_chan_txdone(&goog_mbox->chan, 0);

The patchset doesn't say much about the clients but if the platform
works like this, I have a strong feeling we can do without introducing
mbox_controller.has_queue.
Just use the msg_data[] ringbuffer -- we can avoid changing the core
internals and you will still get ACK for each message.
What are the clients going to be like?

Regards,
Jassi

From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCH 3/4] MFC: Add MFC 5.1 V4L2 driver
Date: Wed, 20 Oct 2010 16:30:42 +0200
Message-ID: <000201cb7063$63119140$2934b3c0$%debski@samsung.com>
References: <1286968160-10629-1-git-send-email-k.debski@samsung.com>
 <1286968160-10629-4-git-send-email-k.debski@samsung.com>
 <002f01cb6e9e$b4ce2cd0$1e6a8670$%oh@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <002f01cb6e9e$b4ce2cd0$1e6a8670$%oh@samsung.com>
Content-language: en-us
Sender: linux-media-owner@vger.kernel.org
To: jaeryul.oh@samsung.com, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, pawel@osciak.com, kyungmin.park@samsung.com, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

>Hi, Kamil
>This is third feedback about watchdog timer. 
>(s5p_mfc.c)

Hi, Peter

Thanks for pointing that out, enabling and disabling watchdog in
open/release is reasonable.

>[...]

>> +	platform_set_drvdata(pdev, dev);
>> +	dev->hw_lock = 0;
>> +	dev->watchdog_workqueue = create_singlethread_workqueue("s5p-mfc");
>> +	INIT_WORK(&dev->watchdog_work, s5p_mfc_watchdog_worker);
>> +	atomic_set(&dev->watchdog_cnt, 0);
>> +	init_timer(&dev->watchdog_timer);
>> +	dev->watchdog_timer.data = 0;
>> +	dev->watchdog_timer.function = s5p_mfc_watchdog;
>> +	dev->watchdog_timer.expires = jiffies +
>> + msecs_to_jiffies(MFC_WATCHDOG_INTERVAL);
>> +	add_timer(&dev->watchdog_timer);

>Watch_dog single thread runs right after probing MFC, but this doesn't look
>like
>nice way in terms of purpose of this timer which is for error handling in
>the 
>middle of decoding. What about moving point running this timer to the
>open().
>And it should be stopped in release time. Of course, dev->num_inst should
>be 
>considered.

Yes, I agree. I've changed that.

> 
>> +
>> +	dev->alloc_ctx = vb2_cma_init_multi(&pdev->dev, 2, s5p_mem_types,
>> +							s5p_mem_alignments);
>> +	if (IS_ERR(dev->alloc_ctx)) {
>> +		mfc_err("Couldn't prepare allocator context.\n");
>> +		ret = PTR_ERR(dev->alloc_ctx);
>> +		goto alloc_ctx_fail;
>> +	}
>> +
>> +	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
>> +	if (ret) {
>> +		v4l2_err(&dev->v4l2_dev, "Failed to register video
>> device\n");
>> +		video_device_release(vfd);
>> +		goto rel_vdev;
>> +	}
>>

--
Kamil Debski
Linux Platform Group
Samsung Poland R&D Center

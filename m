From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [RFC/PATCH 12/13] media: s5p-fimc: Add device tree based sensors
 registration
Date: Wed, 18 Jul 2012 19:28:18 +0200
Message-ID: <5006F232.3000401@gmail.com>
References: <4FBFE1EC.9060209@samsung.com> <1337975573-27117-1-git-send-email-s.nawrocki@samsung.com> <1337975573-27117-12-git-send-email-s.nawrocki@samsung.com> <Pine.LNX.4.64.1207161149230.12302@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1207161149230.12302@axis700.grange>
Sender: linux-media-owner@vger.kernel.org
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 07/16/2012 11:51 AM, Guennadi Liakhovetski wrote:
[...]
>> diff --git a/Documentation/devicetree/bindings/camera/soc/samsung-fimc.txt b/Documentation/devicetree/bindings/camera/soc/samsung-fimc.txt
>> index b459da2..ffe09ac 100644
>> --- a/Documentation/devicetree/bindings/camera/soc/samsung-fimc.txt
>> +++ b/Documentation/devicetree/bindings/camera/soc/samsung-fimc.txt
>> @@ -54,6 +54,28 @@ Required properties:
>>   - cell-index : FIMC-LITE IP instance index;
>>
>>
>> +The 'sensor' nodes
>> +------------------
>> +
>> +Required properties:
>> +
>> + - i2c-client : a phandle to an image sensor I2C client device;
>> +
>> +Optional properties:
>> +
>> +- samsung,camif-mux-id : FIMC video multiplexer input index; for camera
>> +			 port A, B, C the indexes are 0, 1, 0 respectively.
>> +			 If this property is not specified a default 0
>> +			 value will be used by driver.
>
> Isn't it possible to have several clients connected to different mux
> inputs and switch between them at run-time? Even if only one of them can
> be active at any time? That's why I've introduced link nodes in my RFC to
> specify exactly which pads are connected.


Yes, of course it is. For such a configuration there would be multiple
'sensor' nodes and each of them would contain a 'samsung,camif-mux-id'
determining camera port the corresponding sensor/encoder is wired to.

Then switching between the sensors would be possible by setting up
a proper media link (or just through VIDIOC_S_INPUT ioctl, if that's
feasible) and then writing the mux input index and the camera port
type values to the control registers (in this specific case ports A,B 
(index 0, 1) are parallel and port C (index 0) is a serial port).
Thus using only input index wouldn't be sufficient to do the sensors
switch over.

--

Thanks,
Sylwester

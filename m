From: Arun Kumar K <arunkk.samsung@gmail.com>
Subject: Re: [PATCH] [media] s5p-mfc: add init buffer cmd to MFCV6
Date: Fri, 7 Mar 2014 16:39:58 +0530
Message-ID: <CALt3h7_8=jHq821D_7Fi69bFRNk67S18W6T_SFQeSimpHTdOUA@mail.gmail.com>
References: <1394181090-16446-1-git-send-email-arun.kk@samsung.com>
	<53199175.6030606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <53199175.6030606@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: "avnd.kiran" <avnd.kiran@samsung.com>, LMML <linux-media@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, Pawel Osciak <posciak@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

On Fri, Mar 7, 2014 at 2:59 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> Hi,
>
> On 07/03/14 09:31, Arun Kumar K wrote:
>> From: avnd kiran <avnd.kiran@samsung.com>
>>
>> Latest MFC v6 firmware requires tile mode and loop filter
>> setting to be done as part of Init buffer command, in sync
>> with v7. So, move these settings out of decode options reg.
>> Also, make this register definition applicable from v6 onwards.
>>
>> Signed-off-by: avnd kiran <avnd.kiran@samsung.com>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>
> Will the driver also work with older version of the firmware
> after this change ? If not, shouldn't things like this be done
> depending on what firmware version is loaded ?
>

The original code was for the initial version of v6 firmware.
After that the v6 firmware has got many fixes and updates which
also got updated in the products running the same.
As such there are no official multiple versions of v6 firmware, but only
fixes / updates to older version. I will update the s5p-mfc-v6.fw in the
linux-firmware also with the newer version. Hope that will be fine.

Regards
Arun

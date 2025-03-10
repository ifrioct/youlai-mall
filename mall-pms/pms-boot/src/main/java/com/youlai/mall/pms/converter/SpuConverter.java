package com.youlai.mall.pms.converter;

import com.youlai.mall.pms.pojo.entity.PmsSpu;
import com.youlai.mall.pms.pojo.form.PmsSpuForm;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;

/**
 * 商品对象转换器
 *
 * @author haoxr
 * @date 2022/6/11
 */
@Mapper(componentModel = "spring")
public interface SpuConverter {

    @Mappings({
            @Mapping(target = "album", source = "subPicUrls")
    })
    PmsSpu form2Entity(PmsSpuForm form);

    @InheritInverseConfiguration(name="form2Entity")
    PmsSpuForm entity2Form(PmsSpu entity);

}
